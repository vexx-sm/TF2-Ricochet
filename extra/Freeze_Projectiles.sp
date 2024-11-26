#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <sdktools>

bool g_bProjectilesFrozen = false;
StringMap g_ProjectileVelocities;

// A trigger to freeze current active projectiles, ignores new projectiles unless triggered again.
// sm_freezep or sm_fp

public Plugin myinfo = {
    name = "Projectile Freeze Tool",
    author = "vexx-sm",
    description = "Freeze projectiles for debugging purposes",
    version = "1.0.0",
    url = ""
};

public void OnPluginStart()
{
    g_ProjectileVelocities = new StringMap();
    RegAdminCmd("sm_fp", Command_FreezeProjectiles, ADMFLAG_ROOT, "Toggles projectile freeze state");
    RegAdminCmd("sm_freezep", Command_FreezeProjectiles, ADMFLAG_ROOT, "Toggles projectile freeze state");
}
public Action Command_FreezeProjectiles(int client, int args)
{
    g_bProjectilesFrozen = !g_bProjectilesFrozen;
    
    if(g_bProjectilesFrozen)
    {
        FreezeAllProjectiles();
        PrintToChat(client, "[FP] Projectiles frozen");
    }
    else
    {
        UnfreezeAllProjectiles();
        PrintToChat(client, "[FP] Projectiles unfrozen");
    }
    
    return Plugin_Handled;
}

void FreezeAllProjectiles()
{
    g_ProjectileVelocities.Clear();
    char entKey[16];
    float velocity[3];
    
    int entity = -1;
    while ((entity = FindEntityByClassname(entity, "tf_projectile_*")) != -1)
    {
        GetEntPropVector(entity, Prop_Data, "m_vecVelocity", velocity);
        IntToString(EntIndexToEntRef(entity), entKey, sizeof(entKey));
        g_ProjectileVelocities.SetArray(entKey, velocity, 3);
        
        velocity[0] = 0.0;
        velocity[1] = 0.0;
        velocity[2] = 0.0;
        TeleportEntity(entity, NULL_VECTOR, NULL_VECTOR, velocity);
    }
}

void UnfreezeAllProjectiles()
{
    float velocity[3];
    char entKey[16];
    
    int entity = -1;
    while ((entity = FindEntityByClassname(entity, "tf_projectile_*")) != -1)
    {
        IntToString(EntIndexToEntRef(entity), entKey, sizeof(entKey));
        if(g_ProjectileVelocities.GetArray(entKey, velocity, 3))
        {
            TeleportEntity(entity, NULL_VECTOR, NULL_VECTOR, velocity);
        }
    }
    
    g_ProjectileVelocities.Clear();
}


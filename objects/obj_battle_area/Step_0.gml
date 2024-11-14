/// @description Insert description here
// You can write your code in this editor

if (player_entrou)
{
	if (instance_exists(obj_inimigo_base) and point_in_rectangle(obj_inimigo_base.x, obj_inimigo_base.y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2))
	{
		inimigos = true;
	}
	else
	{
		inimigos = false;
	}
}

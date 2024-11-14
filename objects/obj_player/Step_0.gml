/// @description Insert description here
// You can write your code in this editor

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

space = keyboard_check_pressed(vk_space);

punch = keyboard_check(ord("Z"));

left_released = keyboard_check_released(vk_left);
right_released = keyboard_check_released(vk_right);
up_released = keyboard_check_released(vk_up);
down_released = keyboard_check_released(vk_down);


var inimigo = instance_place(x, y, obj_inimigo_base);

if (inimigo != noone)
{
	if (y < inimigo.y)
	{
		depth = 2;
	} 
	else
	{
		depth = 0;
	}
}

if (sangueplayer <= 0 )
{
	estado = player.morrendo;
}


var inst_area = instance_place(x, y, obj_battle_area);

if(inst_area != noone)
{
	inst_area.player_entrou = true;
	
	if(x >= (inst_area.x + inst_area.sprite_width/2) and inst_area.inimigos)
	{
		x = inst_area.x + inst_area.sprite_width/2;
	}
}


switch(estado){
	case player.parado:
	
		xspeed = 0;
		yspeed = 0;
		
		sprite_index = spr_player_idle;
		mask_index = spr_player_idle;
		
		if(left or right or up or down)
		{
			estado = player.andando;
		}
		
		if(space)
		{
			estado = player.pulando;
			pulou = false;
		}
		
		else if(punch){
			estado = player.atacando;
		}
	break;
	
	case player.andando:
	
		sprite_index = spr_player_walk;
		image_speed = 1;
		
		if (left or right)
		{
			if (abs(xspeed) <= velocidade)
			{
				xspeed += (right - left) * velocidade;
			}
		}
		
		if (up or down)
		{
			if (abs(yspeed) <= velocidade)
			{
				yspeed += (down - up) * velocidade;
			}
		}
		
		if (xspeed != 0)
		{
			image_xscale = sign(xspeed);
		}
		
		if(right_released or left_released or up_released or down_released)
		{
			estado = player.parado;
		}
		
		if(space)
		{
			estado = player.pulando;
			pulou = false;
		}
		
		else if(punch){
			estado = player.atacando;
		}
	break;
	
	case player.pulando:
		if (mov_vertical > 0)
		{
			image_index = 1;
		}
		if (place_meeting(x, y, obj_chao) and !pulou)
		{
			temp_y = y;
			mov_vertical = -7.5;
			sprite_index = spr_player_jump;
			image_speed = 0;
			image_index = 0;
			pulou = true;
		}
		else
		{
			if (y < temp_y)
			{
				mov_vertical += gravidade;
			}
			else
			{
				mov_vertical = 0;
				estado = player.parado;
			}
		}
		
		y += mov_vertical;
	break;
	
	case player.atacando:
	
		mask_index = spr_mask_punch;
		
		yspeed = 0;
		xspeed = 0;
		
		var inst = instance_place(x, y, obj_inimigo_base);
		
		if (inst != noone)
		{
			inst.estado = enemy.dano;
		}
		
		if (sprite_index != spr_player_punch)
		{
			sprite_index = spr_player_punch;
			image_speed = 1;		
			image_index = 0;
		}
			
		
		if (image_index == image_number and !punch)
		{
			estado = player.parado;
		}
	break;
	
	case player.dano:
		speed = 0;
		sprite_index = spr_player_damage;
		
		if (!alarm[0])
		{
			sangueplayer--;
			alarm[0] = room_speed/3;
		}
	break;
	
	case player.morrendo:
		sprite_index = spr_player_death;
		
		if (image_index == image_number)
		{
			speed = 0;
			image_speed = 0;
			if (!alarm[1])
			{
				alarm[1] = room_speed/2;
			}
		}
		
		
	break;
}

if (estado != player.pulando)
{
	y = clamp(y, 128, 192);
}


if (estado != player.morrendo and estado != player.pulando)
{
	x += xspeed;
	y += yspeed;
}


















/*
pulo = keyboard_check_pressed(vk_space);

if(place_meeting(x, y, obj_chao)){
	if(y >= temp_y){
		mov_vertical = 0;
	}
	if(pulo){
		temp_y = y;
		mov_vertical =- 7.5; 
	}
}
else{
	mov_vertical += gravidade;
	sprite_index = spr_player_jump;
	image_index = 0;
}

if(mov_vertical > 0){
	image_index = 1;
}

y += mov_vertical;

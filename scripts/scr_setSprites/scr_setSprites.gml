// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setSpriteAndando(_obj){
	var sprite = noone;
	
	switch(_obj)
	{
		case "obj_enemy01":
			sprite = spr_inimigo01_walk;
		break;
		
		case "obj_enemy02":
			sprite = spr_inimigo2_walk;
		break;
		
		case "obj_enemy03":
			sprite = spr_inimigo3_walk;
		break;
	}
	
	return sprite;
}

function setSpriteAtacando(_obj)
{
	var sprite = noone;
	
	switch(_obj)
	{
		case "obj_enemy01":
			sprite = spr_iniimgo01_punch;
		break;
		
		case "obj_enemy02":
			sprite = spr_inimigo2_punch;
		break;
		
		case "obj_enemy03":
			sprite = spr_inimigo3_punch;
		break;
	}
	
	return sprite;
}

function setSpriteDano(_obj)
{
	var sprite = noone;
	
	switch(_obj)
	{
		case "obj_enemy01":
			sprite = spr_inimigo01_damage;
		break;
		
		case "obj_enemy02":
			sprite = spr_inimigo2_damage;
		break;
		
		case "obj_enemy03":
			sprite = spr_inimigo3_damage;
		break;
	}
	
	return sprite;
}

function setSpriteMorte(_obj)
{
	var sprite = noone;
	
	switch(_obj)
	{
		case "obj_enemy01":
			sprite = spr_inimigo_death;
		break;
		
		case "obj_enemy02":
			sprite = spr_inimigo2_death;
		break;
		
		case "obj_enemy03":
			sprite = spr_inimigo3_death;
		break;
	}
	
	return sprite;
}

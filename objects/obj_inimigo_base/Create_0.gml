/// @description Insert description here
// You can write your code in this editor

invencivel = false;
sangue = 10;
sanguemaximo = 10;
mov_horizontal = 0;
mov_vertical = 0;
gravidade = 0.35;
temp_y = 0;
pulou = false;
depth = 1;

seguiu = false;
visao= 50;
distanciagolpe = 5;

nomeObject = object_get_name(object_index);
sprite_andando = setSpriteAndando(nomeObject);
sprite_atacando = setSpriteAtacando(nomeObject);
sprite_dano = setSpriteDano(nomeObject);
sprite_morte = setSpriteMorte(nomeObject);

enum enemy
{
	parado,
	seguindo, 
	atacando,
	dano,
	morte
}

estado = noone;

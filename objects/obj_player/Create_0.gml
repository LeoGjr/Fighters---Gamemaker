/// @description Insert description here
// You can write your code in this editor

gravidade = 0.35;
mov_vertical = 0;
temp_y = 0;
pulou = false;

velocidade = 0.75;
xspeed = 0;
yspeed = 0;
depth = 0;

sangueplayer = 5;
sangueplayermaximo = 5;

enum player{
	parado,
	andando,
	pulando,
	atacando,
	dano,
	morrendo
	
}

estado = player.parado;

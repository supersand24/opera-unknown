/// @description Game Start

randomise();

enum gameState {
	battle,
	path
}

global.game = gameState.battle;
global.has2players = false;
global.timeMoving = true;

enum ui {
	left = 0,
	top = 600,
	right = 560,
	bottom = 700,
	border = 5,
	invSlotSize = 20
}

enum uiSide {
	left = ui.right,
	top = 600,
	right = 600,
	bottom = 700,
	border = 10
}

enum uiPanel {
	healthbarp1, healthbarp2, itemslotsp1, itemslotsp2, timeline, actionsp1, actionsp2
}

enum unitStates {
	idle, walking
}

enum weapon {
	pistol, smg, assault_rifle, lmg, dmr
}


//								[range, dmg, burst]
guns[weapon.pistol]				= [3, 5, 1];
guns[weapon.smg]				= [3, 5, 3];
guns[weapon.assault_rifle]		= [6, 12, 2];
guns[weapon.lmg]				= [6, 12, 3];
guns[weapon.dmr]				= [8, 30, 1];

//							  [	Left,									Top,									Right,								Bottom									];
panel[uiPanel.healthbarp1]	= [	ui.left,								ui.top + 80,							ui.right,							ui.bottom								];
panel[uiPanel.healthbarp2]	= [	ui.right/2,								ui.top + 80,							ui.right,							ui.bottom								];
panel[uiPanel.itemslotsp1]	= [	ui.left,								ui.top,									ui.left + (ui.invSlotSize*3) + 10,	ui.top + ui.invSlotSize + 10			];
panel[uiPanel.itemslotsp2]	= [	ui.right - (ui.invSlotSize*3) - 10,		ui.top,									ui.right,							ui.top + ui.invSlotSize + 10			];
panel[uiPanel.timeline]		= [	array_get(panel[uiPanel.itemslotsp1],2),ui.top,									ui.right,							ui.bottom - 70							];
panel[uiPanel.actionsp1]	= [	ui.left,								array_get(panel[uiPanel.itemslotsp1],3),ui.left + 100,						array_get(panel[uiPanel.healthbarp1],1)	];
panel[uiPanel.actionsp2]	= [	ui.right - 100,							array_get(panel[uiPanel.itemslotsp1],3),ui.right,							array_get(panel[uiPanel.healthbarp1],1)	];

enum itemIndex {
	nothing
}

//types of enemies
enemyTypes = [oRobot, oPuppy, oGrunt, oSoldier, oBeast, oSniper, oBerserker, oCommander];

enum playerInput {
	left, up, right, down, enter, length
}

//Default arrays
ally = undefined;
enemy = undefined;

ally[0] = instance_create_layer(0*tile_size,1*tile_size,"Allies",oPlayer);
//ally[1] = instance_create_layer(3*tile_size,2*tile_size,"Allies",oPlayer);
//ally[2] = instance_create_layer(4*tile_size,2*tile_size,"Allies",oPlayer);
//ally[3] = instance_create_layer(5*tile_size,2*tile_size,"Allies",oPlayer);
//ally[4] = instance_create_layer(5*tile_size,2*tile_size,"Allies",oPlayer);

//Link players to controller
p1 = 0;
p2 = 0;

enum menuState {
	movement, menu, attacking, getTargets
}

p1_menu = menuState.movement;
p2_menu = menuState.movement;

menu_option = 0;
menu_target = 0;

//setRoom();

global.ctBlob[  0 ] = [ 3 , 3 ];

global.ctBlob[ 16 ] = [ 3 , 0 ];
global.ctBlob[ 64 ] = [ 2 , 3 ];
global.ctBlob[  1 ] = [ 3 , 2 ];
global.ctBlob[  4 ] = [ 0 , 3 ];

global.ctBlob[ 85 ] = [ 8 , 4 ];
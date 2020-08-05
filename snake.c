
 
#include "LIB/neslib.h"
#include "LIB/nesdoug.h"
#include "Sprites.h" // holds our metasprite data
#include <stdlib.h>


 
#pragma bss-name(push, "ZEROPAGE")

// GLOBAL VARIABLES
unsigned char sprid; // remember the index into the sprite buffer
unsigned char sprbdyid0;
unsigned char sprbdyid1;
unsigned char sprbdyid2;
unsigned char sprbdyid3;
unsigned char sprbdyid4;
unsigned char sprbdyid5;
unsigned char pad1;
unsigned char pad2;
unsigned char collision;
unsigned char time=1;
unsigned char movex;
unsigned char movey;
unsigned char foodeaten;
unsigned char randgridx;
unsigned char randgridy;
unsigned char collidewithself;


#pragma bss-name(push, "BSS")

struct trails {
	
	unsigned char t0;
	unsigned char t1;
	unsigned char t2;
	unsigned char t3;
	unsigned char t4;
	unsigned char t5;
	unsigned char t6;
	unsigned char t7;
	unsigned char t8;
	unsigned char t9;

};

struct Object {
	unsigned char x;
	unsigned char y;
	unsigned char width;
	unsigned char height;
	unsigned char prevx;
	unsigned char prevy;
};

struct trails trail = {0,0,0,0,0,0,0,0,0,0};

// Initialize a new object!!!!! YEet
struct Object Player = {16,16,7,7,20,20};
struct Object Food = {64,64,7,7,20,20};

// initialize all segments bcuz to lazy to create bettr solution
struct Object Segment0 = {-1,-1,7,7,0,0};
struct Object Segment1 = {-1,-1,7,7,0,0};
struct Object Segment2 = {-1,-1,7,7,0,0};
struct Object Segment3 = {-1,-1,7,7,0,0};
struct Object Segment4 = {-1,-1,7,7,0,0};
struct Object Segment5 = {-1,-1,7,7,0,0};
struct Object Segment6 = {-1,-1,7,7,0,0};
struct Object Segment7 = {-1,-1,7,7,0,0};
struct Object Segment8 = {-1,-1,7,7,0,0};
struct Object Segment9 = {-1,-1,7,7,0,0};
struct Object SegmentA = {-1,-1,7,7,0,0};
struct Object SegmentB = {-1,-1,7,7,0,0};
struct Object SegmentC = {-1,-1,7,7,0,0};
struct Object SegmentD = {-1,-1,7,7,0,0};
struct Object SegmentE = {-1,-1,7,7,0,0};
struct Object SegmentF = {-1,-1,7,7,0,0};

// the width and height should be 1 less than the dimensions (16x16)
// note, I'm using the top left as the 0,0 on x,y


//int time = 1;

const unsigned char text[]="Snake";
const unsigned char postext[]="Position";

const unsigned char palette_bg[]={
0x00, 0x00, 0x10, 0x30, // gray, gray, lt gray, white
0,0,0,0,
0,0,0,0,
0,0,0,0
}; 

const unsigned char palette_sp[]={
0x0f, 0x27, 0x36, 0x19, // blank, yellow, ligher red, green
0x0f, 0x07, 0x16, 0x26, // blank,  brown, red, light red
0,0,0,0,
0,0,0,0
}; 


// PROTOTYPES
void draw_sprites(void);
void movement(void);	
void test_collision(void);
void food_has_been_eaten(void);
void update_trail(void);
void rand_pos_grid_hander(void);
void game_over(void);






	
	
void main (void) {
	
	foodeaten = 2;
	trail.t0 = 0;
	time = 1;
	
	ppu_off(); // screen off
	
	// load the palettes
	pal_bg(palette_bg);
	pal_spr(palette_sp);

	// use the second set of tiles for sprites
	// both bg and sprites are set to 0 by default
	bank_spr(1);

	// load the text
	// vram_adr(NTADR_A(x,y));
	
	vram_adr(NTADR_A(1,1)); 
	vram_write(text,sizeof(text));

	// turn on screen
	ppu_on_all();
	
	

	while (1){
		// infinite loop
		ppu_wait_nmi(); // wait till beginning of the frame
		// the sprites are pushed from a buffer to the OAM during nmi
		
		pad1 = pad_poll(0); // read the first controller
		pad2 = pad_poll(1); // read the second controller
		
		
		movement();
		test_collision();
		draw_sprites();
		
		
		while (Food.x > 200) { // this is a lazy fix for the food being out of bounds issues
			Food.x -= 8;
		}
		
		while (Food.y > 200) { // this is a lazy fix for the food being out of bounds issues
			Food.y -= 8;
		}

	}
}



void food_has_been_eaten(void){
	
	foodeaten += 1;
}

void draw_sprites(void){
	// clear all sprites from sprite buffer
	trail.t0 += 1;
	oam_clear();

	// reset index into the sprite buffer
	sprid = 0;
	
	// draw all metasprites and segments
	sprid = oam_meta_spr(Player.x, Player.y, sprid, PlayerHeadSpr);
	sprid = oam_meta_spr(Food.x, Food.y, sprid, FoodSpr);
	sprid = oam_meta_spr(Segment0.x, Segment0.y, sprid, BodySpr);
	sprid = oam_meta_spr(Segment1.x, Segment1.y, sprid, BodySpr);
	sprid = oam_meta_spr(Segment2.x, Segment2.y, sprid, BodySpr);
	sprid = oam_meta_spr(Segment3.x, Segment3.y, sprid, BodySpr);
	sprid = oam_meta_spr(Segment4.x, Segment4.y, sprid, BodySpr);
	sprid = oam_meta_spr(Segment5.x, Segment5.y, sprid, BodySpr);
	sprid = oam_meta_spr(Segment6.x, Segment6.y, sprid, BodySpr);
	sprid = oam_meta_spr(Segment7.x, Segment7.y, sprid, BodySpr);
	sprid = oam_meta_spr(Segment8.x, Segment8.y, sprid, BodySpr);
	sprid = oam_meta_spr(Segment9.x, Segment9.y, sprid, BodySpr);
	sprid = oam_meta_spr(SegmentA.x, SegmentA.y, sprid, BodySpr);
	sprid = oam_meta_spr(SegmentB.x, SegmentB.y, sprid, BodySpr);
	sprid = oam_meta_spr(SegmentC.x, SegmentC.y, sprid, BodySpr);
	sprid = oam_meta_spr(SegmentD.x, SegmentD.y, sprid, BodySpr);
	sprid = oam_meta_spr(SegmentE.x, SegmentE.y, sprid, BodySpr);
	sprid = oam_meta_spr(SegmentF.x, SegmentF.y, sprid, BodySpr);
	
	
		
	if (trail.t0 == 8 * 1) {
		if (foodeaten > 0) {
			Segment0.x = Player.x;
			Segment0.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 2) {
		if (foodeaten > 1) {
			Segment1.x = Player.x;
			Segment1.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 3) {
		if (foodeaten > 2) {
			Segment2.x = Player.x;
			Segment2.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 4) {
		if (foodeaten > 3) {
			Segment3.x = Player.x;
			Segment3.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 5) {
		if (foodeaten > 4) {
			Segment4.x = Player.x;
			Segment4.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 6) {
		if (foodeaten > 5) {
			Segment5.x = Player.x;
			Segment5.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 7) {
		if (foodeaten > 6) {
			Segment6.x = Player.x;
			Segment6.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 8) {
		if (foodeaten > 7) {
			Segment7.x = Player.x;
			Segment7.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 9) {
		if (foodeaten > 8) {
			Segment8.x = Player.x;
			Segment8.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 10) {
		if (foodeaten > 9) {
			Segment9.x = Player.x;
			Segment9.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 11) {
		if (foodeaten > 10) {
			SegmentA.x = Player.x;
			SegmentA.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 12) {
		if (foodeaten > 11) {
			SegmentB.x = Player.x;
			SegmentB.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 13) {
		if (foodeaten > 12) {
			SegmentC.x = Player.x;
			SegmentC.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 14) {
		if (foodeaten > 13) {
			SegmentD.x = Player.x;
			SegmentD.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 15) {
		if (foodeaten > 14) {
			SegmentE.x = Player.x;
			SegmentE.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * 16) {
		if (foodeaten > 5) {
			SegmentF.x = Player.x;
			SegmentF.y = Player.y;
			
		}
		
	}
	
	if (trail.t0 == 8 * foodeaten) {
		trail.t0 = 0;
	}
}
	
	
	
void movement(void){
	Player.prevx = Player.x;
	Player.prevy = Player.y;
	
	time += 1;
	
	
	
		if (pad1 & PAD_START){
			movey = 0;
			movex = 0;
		}
		if(pad1 & PAD_LEFT){
			movey = 0;
			movex = -1 * 8;
		}
		else if (pad1 & PAD_RIGHT){
			movey = 0;
			movex = 1 * 8;
		}
		if(pad1 & PAD_UP){
			movey = -1 * 8;
			movex = 0;
		}
		else if (pad1 & PAD_DOWN){
			movey = 1 * 8;
			movex = 0;
		}
	
		

	
	
	if (time > 8) { // snap to grid
		Player.x += movex;
		Player.y += movey;
		time = 0;
	}
	
	/*
	if(pad2 & PAD_LEFT){
		BoxGuy2.x -= 1;
	}
	else if (pad2 & PAD_RIGHT){
		BoxGuy2.x += 1;
	}
	if(pad2 & PAD_UP){
		BoxGuy2.y -= 1;
	}
	else if (pad2 & PAD_DOWN){
		BoxGuy2.y += 1;
	}
	*/
}	



void test_collision(void){
	
	rand_pos_grid_hander();
	
	collision = check_collision(&Player, &Food);
		
	collidewithself = check_collision(&Player, &Segment0);
	//c1 = check_collision(&Player, &Segment0);
	// change the BG color, if sprites are touching
	if (collision){
	
		//pal_col(0,0x30);
		
		Food.y = randgridy; // random number is the same each time the game runs
		Food.x = randgridx; // TODO: find a way to utilise 'srand' to create a random number using a seed
		foodeaten += 1;
	}
	
	
	else{
		pal_col(0,0x00);
	}
}

void game_over(void){
	
}


void rand_pos_grid_hander(void){
	
	randgridy += 8;
		if (randgridy > 234) {
			randgridy = 0;
	}
	
	if (time > 3) { // snap to grid
		randgridx += 8;
		if (randgridx > 234) {
			randgridx = 0;
		}
	}
	
	
}

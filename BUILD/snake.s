;
; File generated by cc65 v 2.18 - Git 3b128ba
;
	.fopt		compiler,"cc65 v 2.18 - Git 3b128ba"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_pal_bg
	.import		_pal_spr
	.import		_pal_col
	.import		_ppu_wait_nmi
	.import		_ppu_off
	.import		_ppu_on_all
	.import		_oam_clear
	.import		_oam_meta_spr
	.import		_pad_poll
	.import		_bank_spr
	.import		_vram_adr
	.import		_vram_write
	.import		_check_collision
	.export		_PlayerHeadSpr
	.export		_BodySpr
	.export		_BodySpr1
	.export		_BodySpr2
	.export		_BodySpr3
	.export		_BodySpr4
	.export		_BodySpr5
	.export		_FoodSpr
	.export		_sprid
	.export		_sprbdyid0
	.export		_sprbdyid1
	.export		_sprbdyid2
	.export		_sprbdyid3
	.export		_sprbdyid4
	.export		_sprbdyid5
	.export		_pad1
	.export		_pad2
	.export		_collision
	.export		_time
	.export		_movex
	.export		_movey
	.export		_foodeaten
	.export		_randgridx
	.export		_randgridy
	.export		_collidewithself
	.export		_trail
	.export		_Player
	.export		_Food
	.export		_Segment0
	.export		_Segment1
	.export		_Segment2
	.export		_Segment3
	.export		_Segment4
	.export		_Segment5
	.export		_Segment6
	.export		_Segment7
	.export		_Segment8
	.export		_Segment9
	.export		_SegmentA
	.export		_SegmentB
	.export		_SegmentC
	.export		_SegmentD
	.export		_SegmentE
	.export		_SegmentF
	.export		_text
	.export		_postext
	.export		_palette_bg
	.export		_palette_sp
	.export		_draw_sprites
	.export		_movement
	.export		_test_collision
	.export		_food_has_been_eaten
	.export		_rand_pos_grid_hander
	.export		_game_over
	.export		_main

.segment	"DATA"

_time:
	.byte	$01
_trail:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_Player:
	.byte	$10
	.byte	$10
	.byte	$07
	.byte	$07
	.byte	$14
	.byte	$14
_Food:
	.byte	$40
	.byte	$40
	.byte	$07
	.byte	$07
	.byte	$14
	.byte	$14
_Segment0:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_Segment1:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_Segment2:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_Segment3:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_Segment4:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_Segment5:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_Segment6:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_Segment7:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_Segment8:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_Segment9:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_SegmentA:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_SegmentB:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_SegmentC:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_SegmentD:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_SegmentE:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00
_SegmentF:
	.byte	$FF
	.byte	$FF
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$00

.segment	"RODATA"

_PlayerHeadSpr:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$80
_BodySpr:
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$00
	.byte	$80
_BodySpr1:
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$00
	.byte	$80
_BodySpr2:
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$00
	.byte	$80
_BodySpr3:
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$00
	.byte	$80
_BodySpr4:
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$00
	.byte	$80
_BodySpr5:
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$00
	.byte	$80
_FoodSpr:
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$80
_text:
	.byte	$53,$6E,$61,$6B,$65,$00
_postext:
	.byte	$50,$6F,$73,$69,$74,$69,$6F,$6E,$00
_palette_bg:
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$30
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_palette_sp:
	.byte	$0F
	.byte	$27
	.byte	$36
	.byte	$19
	.byte	$0F
	.byte	$07
	.byte	$16
	.byte	$26
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00

.segment	"BSS"

.segment	"ZEROPAGE"
_sprid:
	.res	1,$00
_sprbdyid0:
	.res	1,$00
_sprbdyid1:
	.res	1,$00
_sprbdyid2:
	.res	1,$00
_sprbdyid3:
	.res	1,$00
_sprbdyid4:
	.res	1,$00
_sprbdyid5:
	.res	1,$00
_pad1:
	.res	1,$00
_pad2:
	.res	1,$00
_collision:
	.res	1,$00
_movex:
	.res	1,$00
_movey:
	.res	1,$00
_foodeaten:
	.res	1,$00
_randgridx:
	.res	1,$00
_randgridy:
	.res	1,$00
_collidewithself:
	.res	1,$00

; ---------------------------------------------------------------
; void __near__ draw_sprites (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_draw_sprites: near

.segment	"CODE"

;
; trail.t0 += 1;
;
	inc     _trail
;
; oam_clear();
;
	jsr     _oam_clear
;
; sprid = 0;
;
	lda     #$00
	sta     _sprid
;
; sprid = oam_meta_spr(Player.x, Player.y, sprid, PlayerHeadSpr);
;
	jsr     decsp3
	lda     _Player
	ldy     #$02
	sta     (sp),y
	lda     _Player+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_PlayerHeadSpr)
	ldx     #>(_PlayerHeadSpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Food.x, Food.y, sprid, FoodSpr);
;
	jsr     decsp3
	lda     _Food
	ldy     #$02
	sta     (sp),y
	lda     _Food+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_FoodSpr)
	ldx     #>(_FoodSpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment0.x, Segment0.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment0
	ldy     #$02
	sta     (sp),y
	lda     _Segment0+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment1.x, Segment1.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment1
	ldy     #$02
	sta     (sp),y
	lda     _Segment1+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment2.x, Segment2.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment2
	ldy     #$02
	sta     (sp),y
	lda     _Segment2+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment3.x, Segment3.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment3
	ldy     #$02
	sta     (sp),y
	lda     _Segment3+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment4.x, Segment4.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment4
	ldy     #$02
	sta     (sp),y
	lda     _Segment4+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment5.x, Segment5.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment5
	ldy     #$02
	sta     (sp),y
	lda     _Segment5+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment6.x, Segment6.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment6
	ldy     #$02
	sta     (sp),y
	lda     _Segment6+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment7.x, Segment7.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment7
	ldy     #$02
	sta     (sp),y
	lda     _Segment7+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment8.x, Segment8.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment8
	ldy     #$02
	sta     (sp),y
	lda     _Segment8+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(Segment9.x, Segment9.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _Segment9
	ldy     #$02
	sta     (sp),y
	lda     _Segment9+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(SegmentA.x, SegmentA.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _SegmentA
	ldy     #$02
	sta     (sp),y
	lda     _SegmentA+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(SegmentB.x, SegmentB.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _SegmentB
	ldy     #$02
	sta     (sp),y
	lda     _SegmentB+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(SegmentC.x, SegmentC.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _SegmentC
	ldy     #$02
	sta     (sp),y
	lda     _SegmentC+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(SegmentD.x, SegmentD.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _SegmentD
	ldy     #$02
	sta     (sp),y
	lda     _SegmentD+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(SegmentE.x, SegmentE.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _SegmentE
	ldy     #$02
	sta     (sp),y
	lda     _SegmentE+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; sprid = oam_meta_spr(SegmentF.x, SegmentF.y, sprid, BodySpr);
;
	jsr     decsp3
	lda     _SegmentF
	ldy     #$02
	sta     (sp),y
	lda     _SegmentF+1
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_BodySpr)
	ldx     #>(_BodySpr)
	jsr     _oam_meta_spr
	sta     _sprid
;
; if (trail.t0 == 8 * 1) {
;
	ldx     #$00
	lda     _trail
	cmp     #$08
	bne     L0247
;
; if (foodeaten > 0) {
;
	lda     _foodeaten
	beq     L0247
;
; Segment0.x = Player.x;
;
	lda     _Player
	sta     _Segment0
;
; Segment0.y = Player.y;
;
	lda     _Player+1
	sta     _Segment0+1
;
; if (trail.t0 == 8 * 2) {
;
L0247:	lda     _trail
	cmp     #$10
	bne     L0248
;
; if (foodeaten > 1) {
;
	lda     _foodeaten
	cmp     #$02
	bcc     L0248
;
; Segment1.x = Player.x;
;
	lda     _Player
	sta     _Segment1
;
; Segment1.y = Player.y;
;
	lda     _Player+1
	sta     _Segment1+1
;
; if (trail.t0 == 8 * 3) {
;
L0248:	lda     _trail
	cmp     #$18
	bne     L0249
;
; if (foodeaten > 2) {
;
	lda     _foodeaten
	cmp     #$03
	bcc     L0249
;
; Segment2.x = Player.x;
;
	lda     _Player
	sta     _Segment2
;
; Segment2.y = Player.y;
;
	lda     _Player+1
	sta     _Segment2+1
;
; if (trail.t0 == 8 * 4) {
;
L0249:	lda     _trail
	cmp     #$20
	bne     L024A
;
; if (foodeaten > 3) {
;
	lda     _foodeaten
	cmp     #$04
	bcc     L024A
;
; Segment3.x = Player.x;
;
	lda     _Player
	sta     _Segment3
;
; Segment3.y = Player.y;
;
	lda     _Player+1
	sta     _Segment3+1
;
; if (trail.t0 == 8 * 5) {
;
L024A:	lda     _trail
	cmp     #$28
	bne     L024B
;
; if (foodeaten > 4) {
;
	lda     _foodeaten
	cmp     #$05
	bcc     L024B
;
; Segment4.x = Player.x;
;
	lda     _Player
	sta     _Segment4
;
; Segment4.y = Player.y;
;
	lda     _Player+1
	sta     _Segment4+1
;
; if (trail.t0 == 8 * 6) {
;
L024B:	lda     _trail
	cmp     #$30
	bne     L024C
;
; if (foodeaten > 5) {
;
	lda     _foodeaten
	cmp     #$06
	bcc     L024C
;
; Segment5.x = Player.x;
;
	lda     _Player
	sta     _Segment5
;
; Segment5.y = Player.y;
;
	lda     _Player+1
	sta     _Segment5+1
;
; if (trail.t0 == 8 * 7) {
;
L024C:	lda     _trail
	cmp     #$38
	bne     L024D
;
; if (foodeaten > 6) {
;
	lda     _foodeaten
	cmp     #$07
	bcc     L024D
;
; Segment6.x = Player.x;
;
	lda     _Player
	sta     _Segment6
;
; Segment6.y = Player.y;
;
	lda     _Player+1
	sta     _Segment6+1
;
; if (trail.t0 == 8 * 8) {
;
L024D:	lda     _trail
	cmp     #$40
	bne     L024E
;
; if (foodeaten > 7) {
;
	lda     _foodeaten
	cmp     #$08
	bcc     L024E
;
; Segment7.x = Player.x;
;
	lda     _Player
	sta     _Segment7
;
; Segment7.y = Player.y;
;
	lda     _Player+1
	sta     _Segment7+1
;
; if (trail.t0 == 8 * 9) {
;
L024E:	lda     _trail
	cmp     #$48
	bne     L024F
;
; if (foodeaten > 8) {
;
	lda     _foodeaten
	cmp     #$09
	bcc     L024F
;
; Segment8.x = Player.x;
;
	lda     _Player
	sta     _Segment8
;
; Segment8.y = Player.y;
;
	lda     _Player+1
	sta     _Segment8+1
;
; if (trail.t0 == 8 * 10) {
;
L024F:	lda     _trail
	cmp     #$50
	bne     L0250
;
; if (foodeaten > 9) {
;
	lda     _foodeaten
	cmp     #$0A
	bcc     L0250
;
; Segment9.x = Player.x;
;
	lda     _Player
	sta     _Segment9
;
; Segment9.y = Player.y;
;
	lda     _Player+1
	sta     _Segment9+1
;
; if (trail.t0 == 8 * 11) {
;
L0250:	lda     _trail
	cmp     #$58
	bne     L0251
;
; if (foodeaten > 10) {
;
	lda     _foodeaten
	cmp     #$0B
	bcc     L0251
;
; SegmentA.x = Player.x;
;
	lda     _Player
	sta     _SegmentA
;
; SegmentA.y = Player.y;
;
	lda     _Player+1
	sta     _SegmentA+1
;
; if (trail.t0 == 8 * 12) {
;
L0251:	lda     _trail
	cmp     #$60
	bne     L0252
;
; if (foodeaten > 11) {
;
	lda     _foodeaten
	cmp     #$0C
	bcc     L0252
;
; SegmentB.x = Player.x;
;
	lda     _Player
	sta     _SegmentB
;
; SegmentB.y = Player.y;
;
	lda     _Player+1
	sta     _SegmentB+1
;
; if (trail.t0 == 8 * 13) {
;
L0252:	lda     _trail
	cmp     #$68
	bne     L0253
;
; if (foodeaten > 12) {
;
	lda     _foodeaten
	cmp     #$0D
	bcc     L0253
;
; SegmentC.x = Player.x;
;
	lda     _Player
	sta     _SegmentC
;
; SegmentC.y = Player.y;
;
	lda     _Player+1
	sta     _SegmentC+1
;
; if (trail.t0 == 8 * 14) {
;
L0253:	lda     _trail
	cmp     #$70
	bne     L0254
;
; if (foodeaten > 13) {
;
	lda     _foodeaten
	cmp     #$0E
	bcc     L0254
;
; SegmentD.x = Player.x;
;
	lda     _Player
	sta     _SegmentD
;
; SegmentD.y = Player.y;
;
	lda     _Player+1
	sta     _SegmentD+1
;
; if (trail.t0 == 8 * 15) {
;
L0254:	lda     _trail
	cmp     #$78
	bne     L0255
;
; if (foodeaten > 14) {
;
	lda     _foodeaten
	cmp     #$0F
	bcc     L0255
;
; SegmentE.x = Player.x;
;
	lda     _Player
	sta     _SegmentE
;
; SegmentE.y = Player.y;
;
	lda     _Player+1
	sta     _SegmentE+1
;
; if (trail.t0 == 8 * 16) {
;
L0255:	lda     _trail
	cmp     #$80
	bne     L0256
;
; if (foodeaten > 5) {
;
	lda     _foodeaten
	cmp     #$06
	bcc     L0256
;
; SegmentF.x = Player.x;
;
	lda     _Player
	sta     _SegmentF
;
; SegmentF.y = Player.y;
;
	lda     _Player+1
	sta     _SegmentF+1
;
; if (trail.t0 == 8 * foodeaten) {
;
L0256:	lda     _foodeaten
	jsr     shlax3
	cpx     #$00
	bne     L01ED
	cmp     _trail
	bne     L01ED
;
; trail.t0 = 0;
;
	stx     _trail
;
; }
;
L01ED:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ movement (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_movement: near

.segment	"CODE"

;
; Player.prevx = Player.x;
;
	lda     _Player
	sta     _Player+4
;
; Player.prevy = Player.y;
;
	lda     _Player+1
	sta     _Player+5
;
; time += 1;
;
	inc     _time
;
; if (pad1 & PAD_START){
;
	lda     _pad1
	and     #$10
	beq     L0259
;
; movey = 0;
;
	lda     #$00
	sta     _movey
;
; movex = 0;
;
	sta     _movex
;
; if(pad1 & PAD_LEFT){
;
L0259:	lda     _pad1
	and     #$02
	beq     L025A
;
; movey = 0;
;
	lda     #$00
	sta     _movey
;
; movex = -1 * 8;
;
	lda     #$F8
;
; else if (pad1 & PAD_RIGHT){
;
	jmp     L0257
L025A:	lda     _pad1
	and     #$01
	beq     L025B
;
; movey = 0;
;
	lda     #$00
	sta     _movey
;
; movex = 1 * 8;
;
	lda     #$08
L0257:	sta     _movex
;
; if(pad1 & PAD_UP){
;
L025B:	lda     _pad1
	and     #$08
	beq     L025C
;
; movey = -1 * 8;
;
	lda     #$F8
;
; else if (pad1 & PAD_DOWN){
;
	jmp     L025F
L025C:	lda     _pad1
	and     #$04
	beq     L025D
;
; movey = 1 * 8;
;
	lda     #$08
L025F:	sta     _movey
;
; movex = 0;
;
	lda     #$00
	sta     _movex
;
; if (time > 8) { // snap to grid
;
L025D:	lda     _time
	cmp     #$09
	bcc     L0218
;
; Player.x += movex;
;
	lda     _movex
	clc
	adc     _Player
	sta     _Player
;
; Player.y += movey;
;
	lda     _movey
	clc
	adc     _Player+1
	sta     _Player+1
;
; time = 0;
;
	lda     #$00
	sta     _time
;
; } 
;
L0218:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ test_collision (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_test_collision: near

.segment	"CODE"

;
; rand_pos_grid_hander();
;
	jsr     _rand_pos_grid_hander
;
; collision = check_collision(&Player, &Food);
;
	lda     #<(_Player)
	ldx     #>(_Player)
	jsr     pushax
	lda     #<(_Food)
	ldx     #>(_Food)
	jsr     _check_collision
	sta     _collision
;
; collidewithself = check_collision(&Player, &Segment0);
;
	lda     #<(_Player)
	ldx     #>(_Player)
	jsr     pushax
	lda     #<(_Segment0)
	ldx     #>(_Segment0)
	jsr     _check_collision
	sta     _collidewithself
;
; if (collision){
;
	lda     _collision
	beq     L0260
;
; Food.y = randgridy; // random number is the same each time the game runs
;
	lda     _randgridy
	sta     _Food+1
;
; Food.x = randgridx; // TODO: find a way to utilise 'srand' to create a random number using a seed
;
	lda     _randgridx
	sta     _Food
;
; foodeaten += 1;
;
	inc     _foodeaten
;
; else{
;
	rts
;
; pal_col(0,0x00);
;
L0260:	jsr     pusha
	jmp     _pal_col

.endproc

; ---------------------------------------------------------------
; void __near__ food_has_been_eaten (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_food_has_been_eaten: near

.segment	"CODE"

;
; foodeaten += 1;
;
	inc     _foodeaten
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ rand_pos_grid_hander (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_rand_pos_grid_hander: near

.segment	"CODE"

;
; randgridy += 8;
;
	lda     #$08
	clc
	adc     _randgridy
	sta     _randgridy
;
; if (randgridy > 234) {
;
	cmp     #$EB
	bcc     L0261
;
; randgridy = 0;
;
	lda     #$00
	sta     _randgridy
;
; if (time > 3) { // snap to grid
;
L0261:	lda     _time
	cmp     #$04
	bcc     L0242
;
; randgridx += 8;
;
	lda     #$08
	clc
	adc     _randgridx
	sta     _randgridx
;
; if (randgridx > 234) {
;
	cmp     #$EB
	bcc     L0242
;
; randgridx = 0;
;
	lda     #$00
	sta     _randgridx
;
; }
;
L0242:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ game_over (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_game_over: near

.segment	"CODE"

;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; foodeaten = 2;
;
	lda     #$02
	sta     _foodeaten
;
; trail.t0 = 0;
;
	lda     #$00
	sta     _trail
;
; time = 1;
;
	lda     #$01
	sta     _time
;
; ppu_off(); // screen off
;
	jsr     _ppu_off
;
; pal_bg(palette_bg);
;
	lda     #<(_palette_bg)
	ldx     #>(_palette_bg)
	jsr     _pal_bg
;
; pal_spr(palette_sp);
;
	lda     #<(_palette_sp)
	ldx     #>(_palette_sp)
	jsr     _pal_spr
;
; bank_spr(1);
;
	lda     #$01
	jsr     _bank_spr
;
; vram_adr(NTADR_A(1,1)); 
;
	ldx     #$20
	lda     #$21
	jsr     _vram_adr
;
; vram_write(text,sizeof(text));
;
	lda     #<(_text)
	ldx     #>(_text)
	jsr     pushax
	ldx     #$00
	lda     #$06
	jsr     _vram_write
;
; ppu_on_all();
;
	jsr     _ppu_on_all
;
; ppu_wait_nmi(); // wait till beginning of the frame
;
L00DE:	jsr     _ppu_wait_nmi
;
; pad1 = pad_poll(0); // read the first controller
;
	lda     #$00
	jsr     _pad_poll
	sta     _pad1
;
; pad2 = pad_poll(1); // read the second controller
;
	lda     #$01
	jsr     _pad_poll
	sta     _pad2
;
; movement();
;
	jsr     _movement
;
; test_collision();
;
	jsr     _test_collision
;
; draw_sprites();
;
	jsr     _draw_sprites
;
; while (Food.x > 200) { // this is a lazy fix for the food being out of bounds issues
;
	jmp     L00EE
;
; Food.x -= 8;
;
L0262:	lda     _Food
	sec
	sbc     #$08
	sta     _Food
;
; while (Food.x > 200) { // this is a lazy fix for the food being out of bounds issues
;
L00EE:	lda     _Food
	cmp     #$C9
	bcs     L0262
;
; while (Food.y > 200) { // this is a lazy fix for the food being out of bounds issues
;
	jmp     L0264
;
; Food.y -= 8;
;
L0263:	lda     _Food+1
	sec
	sbc     #$08
	sta     _Food+1
;
; while (Food.y > 200) { // this is a lazy fix for the food being out of bounds issues
;
L0264:	lda     _Food+1
	cmp     #$C9
	bcs     L0263
;
; while (1){
;
	jmp     L00DE

.endproc


#pragma once

static const bool opcodeAllowChannelSplitting[D3DSHADER_INSTRUCTION_OPCODE_TYPE::D3DSIO_BREAKP + 1] =
{
	true, //D3DSIO_NOP          = 0,
    true, //D3DSIO_MOV          ,
	true, //D3DSIO_ADD          ,
    true, //D3DSIO_SUB          ,
    true, //D3DSIO_MAD          ,
    true, //D3DSIO_MUL          ,
    true, //D3DSIO_RCP          ,
    true, //D3DSIO_RSQ          ,
	false, //D3DSIO_DP3          ,
    false, //D3DSIO_DP4          ,
    true, //D3DSIO_MIN          ,
    true, //D3DSIO_MAX          ,
    true, //D3DSIO_SLT          ,
    true, //D3DSIO_SGE          ,
    true, //D3DSIO_EXP          ,
    true, //D3DSIO_LOG          ,
    true, //D3DSIO_LIT          ,
    false, //D3DSIO_DST          ,
	true, //D3DSIO_LRP          ,
    true, //D3DSIO_FRC          ,
    false, //D3DSIO_M4x4         ,
    false, //D3DSIO_M4x3         ,
    false, //D3DSIO_M3x4         ,
    false, //D3DSIO_M3x3         ,
    false, //D3DSIO_M3x2         ,
    true, //D3DSIO_CALL         ,
    true, //D3DSIO_CALLNZ       ,
    true, //D3DSIO_LOOP         ,
    true, //D3DSIO_RET          ,
    true, //D3DSIO_ENDLOOP      ,
    true, //D3DSIO_LABEL        ,
    true, //D3DSIO_DCL          ,
    true, //D3DSIO_POW          ,
    false, //D3DSIO_CRS          ,
    true, //D3DSIO_SGN          ,
    true, //D3DSIO_ABS          ,
	false, //D3DSIO_NRM          ,
    false, //D3DSIO_SINCOS       ,
    true, //D3DSIO_REP          ,
    true, //D3DSIO_ENDREP       ,
    true, //D3DSIO_IF           ,
    true, //D3DSIO_IFC          ,
    true, //D3DSIO_ELSE         ,
    true, //D3DSIO_ENDIF        ,
    true, //D3DSIO_BREAK        ,
    true, //D3DSIO_BREAKC       ,
    true, //D3DSIO_MOVA         ,
    true, //D3DSIO_DEFB         ,
    true, //D3DSIO_DEFI         ,

	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,

    false, //D3DSIO_TEXCOORD     = 64,
    true, //D3DSIO_TEXKILL      ,
    false, //D3DSIO_TEX          ,
    false, //D3DSIO_TEXBEM       ,
    false, //D3DSIO_TEXBEML      ,
    false, //D3DSIO_TEXREG2AR    ,
    false, //D3DSIO_TEXREG2GB    ,
    false, //D3DSIO_TEXM3x2PAD   ,
    false, //D3DSIO_TEXM3x2TEX   ,
    false, //D3DSIO_TEXM3x3PAD   ,
    false, //D3DSIO_TEXM3x3TEX   ,
    true, //D3DSIO_RESERVED0    ,
    false, //D3DSIO_TEXM3x3SPEC  ,
    false, //D3DSIO_TEXM3x3VSPEC ,
    true, //D3DSIO_EXPP         ,
    true, //D3DSIO_LOGP         ,
    true, //D3DSIO_CND          ,
    true, //D3DSIO_DEF          ,
    false, //D3DSIO_TEXREG2RGB   ,
    false, //D3DSIO_TEXDP3TEX    ,
    false, //D3DSIO_TEXM3x2DEPTH ,
	false, //D3DSIO_TEXDP3       ,
    false, //D3DSIO_TEXM3x3      ,
    false, //D3DSIO_TEXDEPTH     ,
    true, //D3DSIO_CMP          ,
    true, //D3DSIO_BEM          ,
    false, //D3DSIO_DP2ADD       ,
    true, //D3DSIO_DSX          ,
    true, //D3DSIO_DSY          ,
    false, //D3DSIO_TEXLDD       ,
    true, //D3DSIO_SETP         ,
    true, //D3DSIO_TEXLDL       ,
    true, //D3DSIO_BREAKP       ,
};

static const bool opcodeAllChannelsBroadcastSameVal[D3DSHADER_INSTRUCTION_OPCODE_TYPE::D3DSIO_BREAKP + 1] =
{
	false, //D3DSIO_NOP          = 0,
    false, //D3DSIO_MOV          ,
	false, //D3DSIO_ADD          ,
    false, //D3DSIO_SUB          ,
    false, //D3DSIO_MAD          ,
    false, //D3DSIO_MUL          ,
    true, //D3DSIO_RCP          ,
    true, //D3DSIO_RSQ          ,
	true, //D3DSIO_DP3          ,
    true, //D3DSIO_DP4          ,
    false, //D3DSIO_MIN          ,
    false, //D3DSIO_MAX          ,
    false, //D3DSIO_SLT          ,
    false, //D3DSIO_SGE          ,
    false, //D3DSIO_EXP          ,
    true, //D3DSIO_LOG          ,
    false, //D3DSIO_LIT          ,
    true, //D3DSIO_DST          ,
	false, //D3DSIO_LRP          ,
    false, //D3DSIO_FRC          ,
    false, //D3DSIO_M4x4         ,
    false, //D3DSIO_M4x3         ,
    false, //D3DSIO_M3x4         ,
    false, //D3DSIO_M3x3         ,
    false, //D3DSIO_M3x2         ,
    false, //D3DSIO_CALL         ,
    false, //D3DSIO_CALLNZ       ,
    false, //D3DSIO_LOOP         ,
    false, //D3DSIO_RET          ,
    false, //D3DSIO_ENDLOOP      ,
    false, //D3DSIO_LABEL        ,
    false, //D3DSIO_DCL          ,
    true, //D3DSIO_POW          ,
    false, //D3DSIO_CRS          ,
    false, //D3DSIO_SGN          ,
    false, //D3DSIO_ABS          ,
	false, //D3DSIO_NRM          ,
    false, //D3DSIO_SINCOS       ,
    false, //D3DSIO_REP          ,
    false, //D3DSIO_ENDREP       ,
    false, //D3DSIO_IF           ,
    false, //D3DSIO_IFC          ,
    false, //D3DSIO_ELSE         ,
    false, //D3DSIO_ENDIF        ,
    false, //D3DSIO_BREAK        ,
    false, //D3DSIO_BREAKC       ,
    false, //D3DSIO_MOVA         ,
    false, //D3DSIO_DEFB         ,
    false, //D3DSIO_DEFI         ,

	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,

    false, //D3DSIO_TEXCOORD     = 64,
    false, //D3DSIO_TEXKILL      ,
    false, //D3DSIO_TEX          ,
    false, //D3DSIO_TEXBEM       ,
    false, //D3DSIO_TEXBEML      ,
    false, //D3DSIO_TEXREG2AR    ,
    false, //D3DSIO_TEXREG2GB    ,
    false, //D3DSIO_TEXM3x2PAD   ,
    false, //D3DSIO_TEXM3x2TEX   ,
    false, //D3DSIO_TEXM3x3PAD   ,
    false, //D3DSIO_TEXM3x3TEX   ,
    false, //D3DSIO_RESERVED0    ,
    false, //D3DSIO_TEXM3x3SPEC  ,
    false, //D3DSIO_TEXM3x3VSPEC ,
    true, //D3DSIO_EXPP         ,
    true, //D3DSIO_LOGP         ,
    false, //D3DSIO_CND          ,
    false, //D3DSIO_DEF          ,
    false, //D3DSIO_TEXREG2RGB   ,
    false, //D3DSIO_TEXDP3TEX    ,
    false, //D3DSIO_TEXM3x2DEPTH ,
	false, //D3DSIO_TEXDP3       ,
    false, //D3DSIO_TEXM3x3      ,
    false, //D3DSIO_TEXDEPTH     ,
    false, //D3DSIO_CMP          ,
    false, //D3DSIO_BEM          ,
    false, //D3DSIO_DP2ADD       ,
    false, //D3DSIO_DSX          ,
    false, //D3DSIO_DSY          ,
    false, //D3DSIO_TEXLDD       ,
    false, //D3DSIO_SETP         ,
    false, //D3DSIO_TEXLDL       ,
    false, //D3DSIO_BREAKP       ,
};

static const bool opcodeImplementedForJIT[D3DSHADER_INSTRUCTION_OPCODE_TYPE::D3DSIO_BREAKP + 1] =
{
	true, //D3DSIO_NOP          = 0,
    true, //D3DSIO_MOV          ,
	true, //D3DSIO_ADD          ,
    true, //D3DSIO_SUB          ,
    true, //D3DSIO_MAD          ,
    true, //D3DSIO_MUL          ,
    true, //D3DSIO_RCP          ,
    true, //D3DSIO_RSQ          ,
	true, //D3DSIO_DP3          ,
    true, //D3DSIO_DP4          ,
    true, //D3DSIO_MIN          ,
    true, //D3DSIO_MAX          ,
    true, //D3DSIO_SLT          ,
    true, //D3DSIO_SGE          ,
    true, //D3DSIO_EXP          ,
    true, //D3DSIO_LOG          ,
    true, //D3DSIO_LIT          ,
    true, //D3DSIO_DST          ,
	true, //D3DSIO_LRP          ,
    true, //D3DSIO_FRC          ,
    true, //D3DSIO_M4x4         ,
    true, //D3DSIO_M4x3         ,
    true, //D3DSIO_M3x4         ,
    true, //D3DSIO_M3x3         ,
    true, //D3DSIO_M3x2         ,
    false, //D3DSIO_CALL         ,
    false, //D3DSIO_CALLNZ       ,
    false, //D3DSIO_LOOP         ,
    false, //D3DSIO_RET          ,
    false, //D3DSIO_ENDLOOP      ,
    false, //D3DSIO_LABEL        ,
    true, //D3DSIO_DCL          ,
    true, //D3DSIO_POW          ,
    true, //D3DSIO_CRS          ,
    true, //D3DSIO_SGN          ,
    true, //D3DSIO_ABS          ,
	true, //D3DSIO_NRM          ,
    false, //D3DSIO_SINCOS       ,
    false, //D3DSIO_REP          ,
    false, //D3DSIO_ENDREP       ,
    false, //D3DSIO_IF           ,
    false, //D3DSIO_IFC          ,
    false, //D3DSIO_ELSE         ,
    false, //D3DSIO_ENDIF        ,
    false, //D3DSIO_BREAK        ,
    false, //D3DSIO_BREAKC       ,
    false, //D3DSIO_MOVA         ,
    true, //D3DSIO_DEFB         ,
    true, //D3DSIO_DEFI         ,

	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,

    false, //D3DSIO_TEXCOORD     = 64,
    true, //D3DSIO_TEXKILL      ,
    true, //D3DSIO_TEX          ,
    false, //D3DSIO_TEXBEM       ,
    false, //D3DSIO_TEXBEML      ,
    false, //D3DSIO_TEXREG2AR    ,
    false, //D3DSIO_TEXREG2GB    ,
    false, //D3DSIO_TEXM3x2PAD   ,
    false, //D3DSIO_TEXM3x2TEX   ,
    false, //D3DSIO_TEXM3x3PAD   ,
    false, //D3DSIO_TEXM3x3TEX   ,
    false, //D3DSIO_RESERVED0    ,
    false, //D3DSIO_TEXM3x3SPEC  ,
    false, //D3DSIO_TEXM3x3VSPEC ,
    true, //D3DSIO_EXPP         ,
    true, //D3DSIO_LOGP         ,
    false, //D3DSIO_CND          ,
    false, //D3DSIO_DEF          ,
    false, //D3DSIO_TEXREG2RGB   ,
    false, //D3DSIO_TEXDP3TEX    ,
    false, //D3DSIO_TEXM3x2DEPTH ,
	false, //D3DSIO_TEXDP3       ,
    false, //D3DSIO_TEXM3x3      ,
    false, //D3DSIO_TEXDEPTH     ,
    true, //D3DSIO_CMP          ,
    false, //D3DSIO_BEM          ,
    true, //D3DSIO_DP2ADD       ,
    false, //D3DSIO_DSX          ,
    false, //D3DSIO_DSY          ,
    false, //D3DSIO_TEXLDD       ,
    false, //D3DSIO_SETP         ,
    false, //D3DSIO_TEXLDL       ,
    false, //D3DSIO_BREAKP       ,
};
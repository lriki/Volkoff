//=============================================================================
//�y LFramework �z
//-----------------------------------------------------------------------------
///**
//  @file       LFramework.h
//  @brief      LFramework
//  @version    1.0
//  @date       2010/09/10
//*/
//=============================================================================

#pragma once
#include "LGameScene.h"

//-------------------------------------------------------------------------
//
//-------------------------------------------------------------------------
namespace LNote
{

//=============================================================================
// �� LFramework �N���X
//-----------------------------------------------------------------------------
///**
//  @brief      ���C�u�����S�̂̓�����Ǘ�����N���X
//
//  @par
//              ���̃N���X�̃C���X�^���X�ɂ́A
//              �O���[�o���ϐ� LNote::Accessor::Framework �ɂ���Ă��A�N�Z�X�ł��܂��B
//*/
//=============================================================================
class LFramework
{
public:

    //---------------------------------------------------------------------
    ///**
    //  @brief      �t���[���X�V�񐔂̎擾
    //*/
	//---------------------------------------------------------------------
    //u32 getFrameCount() const;


    //---------------------------------------------------------------------
    ///**
    //  @brief      update() �ōs���������w�肷��
    //
    //  @param[in]  flags_ : LNAutoUpdateFlags �̃t���O�̑g�ݍ��킹
    //
    //  @par
    //              LN_AUTOUPDATE_SYSTEM ���w�肵�Ȃ������ꍇ�A
    //              Framework �̓A�v���P�[�V�����ɏI���v��(�E�B���h�E�́~�{�^�����N���b�N���ꂽ��)
    //              �����Ă��邩�𔻒�ł��Ȃ��Ȃ�܂��B<br>
    //              ���̏ꍇ update() �͏�� true ��Ԃ��܂��B<br>
    //              <br>
    //              LN_AUTOUPDATE_SYSTEM    : ���b�Z�[�W�����ƃt���[���҂��������s�� (��� ON �𐄏�)<br>
	//              LN_AUTOUPDATE_INPUT     : ���͋@�\�̍X�V���s��<br>
	//              LN_AUTOUPDATE_AUDIO     : �����@�\�̍X�V���s��<br>
	//              LN_AUTOUPDATE_SCENE     : �Q�[����ʂ̕`����s��<br>
    //*/
	//---------------------------------------------------------------------
    //void setAutoUpdateFlags( u32 flags_ );

    //---------------------------------------------------------------------	
    ///**
    //  @brief      �t���[���X�V
    //
    //  @par
    //              ���C�u�����S�̂� 1 �t���[�����X�V���܂��B
    //              �ʏ�A1 �t���[���� 1 �x�����Ăяo���܂��B<br>
    //
    //  @attention
    //              run() �ɂ���ăQ�[���V�[�������s���Ă���ꍇ�A�X�V������
    //              LGameScene �N���X�̓����ōs���܂��B
    //              ���̏ꍇ�͕s��h�~�̂��߁A���̊֐��͉����s�킸�ɏ��
    //              true ��Ԃ��悤�ɂȂ�܂��B
    //*/
	//---------------------------------------------------------------------
	static bool update();

    //---------------------------------------------------------------------
    ///**
    //  @brief      �Q�[���V�[����^���Ď��s�J�n
    //
    //  @par
    //              ���̊֐��́A�A�v���P�[�V�����ɏI���v��������(�E�B���h�E��
    //              �N���[�Y�{�^����������铙)���Aexit() ���Ă΂��܂�
    //              �I�������A�����ŃQ�[���̃��C�����[�v�����s�������܂��B<br>
    //              <br>
    //              ���̊֐��Ŏ��s���J�n�����ꍇ�A�ȍ~�̍X�V������ LGameScene
    //              �N���X�̓����ōs���܂��B���̂��߁Aupdate() ���Ăяo���K�v��
    //              ����܂���B
    //*/
	//---------------------------------------------------------------------
	static void run( LGameScene* scene_ );

    

};

//-------------------------------------------------------------------------
//
//-------------------------------------------------------------------------

} // namespace LNote

//=============================================================================
//                              end of file
//=============================================================================
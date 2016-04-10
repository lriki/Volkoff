//=============================================================================
//�y GameScene �z
//-----------------------------------------------------------------------------
///**
//  @file       GameScene.h
//  @brief      GameScene
//  @author     Riki
//*/
//=============================================================================

#pragma once

//-------------------------------------------------------------------------
//
//-------------------------------------------------------------------------
#include "GameSceneManager.h"

//-------------------------------------------------------------------------
//
//-------------------------------------------------------------------------
namespace LNote
{
namespace Utility
{

//=============================================================================
// �� GameScene �N���X
//-----------------------------------------------------------------------------
///**
//  @brief     �^�C�g����ʁA�o�g����ʓ��A�ЂƂ̃Q�[���V�[����\���N���X�̊��
//*/
//=============================================================================
class GameScene
    : public RefObject
{
public:

    /// �R���X�g���N�^
	GameScene( GameSceneManager* manager_ );

	/// �f�X�g���N�^
    virtual ~GameScene() {}

public:

    //---------------------------------------------------------------------
    ///**
    //  @brief      �V�[�����̎擾
    //*/
    //---------------------------------------------------------------------
	virtual const TCHAR* getSceneName() { return NULL; }

    //---------------------------------------------------------------------
    ///**
    //  @brief      �J�n����
    //*/
    //---------------------------------------------------------------------
	virtual void onStart() {}

    //---------------------------------------------------------------------
    ///**
    //  @brief      �t���[���X�V
    //*/
    //---------------------------------------------------------------------
	virtual void onUpdate() {}

    //---------------------------------------------------------------------
    ///**
    //  @brief      �I������
    //*/
    //---------------------------------------------------------------------
	virtual void onTerminate() {}

public:

    //---------------------------------------------------------------------
    ///**
    //  @brief      �V�[���̕ύX
    //
    //  @par
    //              �s��h�~�̂��߁A�Ăяo�����V�[�����A�N�e�B�u�ł͂Ȃ��ꍇ��
    //              �ύX���s���܂���B
    //*/
    //---------------------------------------------------------------------
    void changeScene( const TCHAR* scene_name_ );

    void changeScene( GameScene* next_scene_ );

    //---------------------------------------------------------------------
    ///**
    //  @brief      �V�[���̌Ăяo��
    //
    //  @par
    //              �w�肵���V�[�����q�V�[���Ƃ��ČĂяo���܂��B
    //              ���̃V�[���ɖ߂�ɂ́A�q�V�[������ returnScene() ���Ăт܂��B
    //*/
    //---------------------------------------------------------------------
    void callScene( const TCHAR* scene_name_ );

    void callScene( GameScene* next_scene_ );

    //---------------------------------------------------------------------
    ///**
    //  @brief      �Ăяo�����̃V�[�� (�e�V�[��) �֖߂�
    //*/
    //---------------------------------------------------------------------
    void returnScene( const TCHAR* parent_name_ );

    //---------------------------------------------------------------------
    ///**
    //  @brief      �A�N�e�B�u�ȃV�[�����𔻒肷��
    //*/
    //---------------------------------------------------------------------
    bool isActiveScene() const;

    //---------------------------------------------------------------------
    ///**
    //  @brief      �e�Q�[���V�[���̎擾
    //*/
    //---------------------------------------------------------------------
    GameScene* getParentScene() const { return _lngs.mParent; }


private:

    struct
    {
        GameSceneManager*   mManager;
        GameScene*          mParent;
        bool                mIsActive;  ///< Manager ������s���̏ꍇ true (�e�̏ꍇ����� true)

    } _lngs;

    friend class GameSceneManager;
};

//-------------------------------------------------------------------------
//
//-------------------------------------------------------------------------

} // namespace Utility
} // namespace LNote

//=============================================================================
//                              end of file
//=============================================================================
//=============================================================================
//【 EffectBase 】
//-----------------------------------------------------------------------------
///**
//  @file       EffectBase.h
//  @brief      EffectBase
//  @author     yama
//*/
//=============================================================================

#pragma once

#include "EffectManager.h"

//=============================================================================
// ■ EffectBase クラス
//-----------------------------------------------------------------------------
///**
//  @brief		エフェクトの基底クラス
//*/
//=============================================================================
class EffectBase
{
public:

	/// コンストラクタ
    EffectBase();

    /// デストラクタ
    virtual ~EffectBase();

public:

    /// フレーム更新 (false を返すと解放する)
    virtual bool update() { return false; }

};

//=============================================================================
//								end of file
//=============================================================================
//=============================================================================
//【 EntryPoint 】
//=============================================================================

//-------------------------------------------------------------------------
//
//-------------------------------------------------------------------------
#include "stdafx.h"
#include "Gateway.h"

//-------------------------------------------------------------------------
// ▼ 
//-------------------------------------------------------------------------

void lnConfig(EngineSettings* settings);
int  lnMain();

namespace LNote
{

//-------------------------------------------------------------------------
// ● 内部処理用のエントリーポイント
//-------------------------------------------------------------------------
static int EntryPoint( int argc_, char* argv_[] )
{
	return run( lnMain, lnConfig );
}

} // namespace LNote

//-------------------------------------------------------------------------
// ● WinMain()
//		コマンドライン引数を、main() で得られる形に変換した後で
//		LNote::EntryPoint() を呼び出す。
//-------------------------------------------------------------------------
#if defined(LNOTE_WINDOWS)
int WINAPI WinMain( HINSTANCE instance_, HINSTANCE prev_inst_, LPSTR cmdline_, int showcmd_ )
{
	char* c = GetCommandLineA();
	
	// 件数を調べる
	int argc = 0;
	for ( ; *c; ++argc )
	{
		// 先頭や途中や最後に使われている空白をスキップする
		while ( *c == ' ' ) { ++c; }

		// コマンドライン最後の空白だった場合，ループから抜ける
		if ( !( *c ) ) { break; }

		// "" で囲まれた文字列を処理
		if ( *c =='\"' )
		{
			// " をスキップ
			++c;

			// 終わりの " を探す
			while ( *c && *c != '\"' ) { ++c; }

			// この時点で c は " を指しているので、次の文字に移動
			++c;
		}
		// スペースで囲まれた文字列を処理
		else
		{
			// 次の空白まで移動
			while ( *c && *c != ' ' ) { ++c; }
		}
	}

	c = GetCommandLineA();
	char** argv = static_cast< char** >( malloc( sizeof( char* ) * argc ) );
	int i = 0;

	while ( *c )
	{
		// 先頭や途中や最後に使われている空白をスキップする
		while ( *c == ' ' ) { ++c; }

		// コマンドライン最後の空白だった場合，ループから抜ける
		if ( !( *c ) ) { break; }

		// "" で囲まれた文字列を処理
		if ( *c =='\"' )
		{
			// " をスキップ
			++c;

			argv[ i ] = c;
			++i;

			// 終わりの " を探す
			while ( *c && *c != '\"' ) { ++c; }

			*c = '\0';	// " を \0 に変えて区切る

			++c;
		}
		// スペースで囲まれた文字列を処理
		else
		{
			// 次の空白まで移動
			while ( *c && *c != ' ' ) { ++c; }
		}
	}

	int r = LNote::EntryPoint( argc, argv );

	SAFE_FREE( argv );

	return r;
}
#endif

//-------------------------------------------------------------------------
// ● main()
//-------------------------------------------------------------------------
int main( int argc_, char* argv_[] )
{
	return LNote::EntryPoint( argc_, argv_ );
}

//=============================================================================
//								end of file
//=============================================================================
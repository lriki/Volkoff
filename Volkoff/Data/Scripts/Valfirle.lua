//=============================================================================
//�y Character_BareHands �z
//-----------------------------------------------------------------------------
//  �f���Ԃ̓���̒�`
//=============================================================================

//---------------------------------------------------------------------
// �� �t���[���X�V
//      chara_       : Character �̃|�C���^
//      state_       : �L�����N�^�[�̏�� (enum CharaState �̒l)
//      frame_count_ : �A�j���t���[���� (���̊֐����I�������� +1 �����)
//---------------------------------------------------------------------
function update( chara_, state_, frame_count_ )

    //-------------------------------------------------------------
    // �� �ҋ@���
    if state_ == CHARASTATE_WAIT then
    	setNum(chara_,Rand()%4)
        setPuttern( chara_, 0 )
		setFrameCount( chara_, -1 )
        
	//-------------------------------------------------------------
    // �� ������
    elseif state_ == CHARASTATE_RUN then
    	setNum(chara_,Rand()%4)
		if getOnGround( chara_ ) then
			// �n��ł͕��s���[�V����
			if frame_count_ < 20 then
				setPuttern( chara_, 12 + frame_count_ / 5 )
			else
				// �o�߃t���[������ 0 �ɖ߂�
				setFrameCount( chara_, -1 )
			end
		else
			// �󒆂ł̓W�����v���[�V����
			if frame_count_  <= 7 then
				setPuttern( chara_, 24  )
			elseif frame_count_ >= 8 then
				setPuttern( chara_, 25 )
			end
		end
		if getPhase(chara_) == 1 then
			a = Rand()%60

			if a == 0 then
				setCharaState( chara_, CHARASTATE_ATTACK_JUMP_ATTACK )
			end
			if a == 1 then
				setCharaState( chara_, CHARASTATE_ATTACK_SQUAT_ATTACK )
			end
			if a == 2 then 
				setCharaState( chara_, CHARASTATE_ATTACK_ANTIAIR_ATTACK )
			end
			if getRank() == 3 then
				a = Rand()%60

				if a == 0 then
					setCharaState( chara_, CHARASTATE_ATTACK_JUMP_ATTACK )
				end
				if a == 1 then
					setCharaState( chara_, CHARASTATE_ATTACK_SQUAT_ATTACK )
				end
				if a == 2 then 
					setCharaState( chara_, CHARASTATE_ATTACK_ANTIAIR_ATTACK )
				end
			end
		end

	//-------------------------------------------------------------
    // �� �W�����v
    elseif state_ == CHARASTATE_JUMP then
    	setNum(chara_,Rand()%4)
		if frame_count_  <= 7 then
			setPuttern( chara_, 24 )
		elseif frame_count_ == 8 then
			setPuttern( chara_, 25 )
		end

	//-------------------------------------------------------------
    // �� ���Ⴊ��
    elseif state_ == CHARASTATE_SQUAT then
    	setNum(chara_,Rand()%4)
		if frame_count_ < 2 then
			setPuttern( chara_, 36 )
		else
			setPuttern( chara_, 37 )
            setFrameCount( chara_, 3 )
		end

	//-------------------------------------------------------------
    // �� �̂�����
    elseif state_ == CHARASTATE_STUN then
    	setNum(chara_,Rand()%4)
		setPuttern( chara_, 48 )

		if getPhase(chara_) == 0  and frame_count_ == 1 then
			if Rand()%15 == 1 then
				SummonEnemy()
			end
		end

		if getPhase(chara_) == 1 and frame_count_ == 1 then

			if getRank() ==2 then
				if Rand()%11 == 1 then
					x, y = getCharaPosition( chara_ )					
					Division(chara_,x,y)
					PlaySE("./Data/Sound/SE/machine_call.wav",100,100)
					CreateEffect(4,x,y)
				end
			end
			if getRank() ==3 then
				if Rand()%7 == 1 then
					x, y = getCharaPosition( chara_ ,x,y)		
					Division(chara_,x,y)	
					PlaySE("./Data/Sound/SE/machine_call.wav",100,100)	
					CreateEffect(4,x,y)
				end
			end
			if Rand()%10 == 1 then
				setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
				setNum(chara_,1)
			end
			if Rand()%10 == 1 and getRank() == 3 then
				setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
				setNum(chara_,1)
			end	
		end
        
	//-------------------------------------------------------------
    // �� �������
    elseif state_ == CHARASTATE_BLOW then
		if getPhase(chara_) == 0 then
			if frame_count_ == 1 then
				setPuttern( chara_, 60 )
			end
			if frame_count_ == 3 then
				setPuttern( chara_, 61 )
			end
			if frame_count_ == 5 then 
				setPuttern( chara_, 62 )
			end
			if frame_count_ == 7 then 
				setPuttern( chara_, 63 )
			end
			if frame_count_ == 9 then 
				setPuttern( chara_, 64)
			end
			if frame_count_ == 11 then
				setPuttern( chara_, 65)	
			end		
			if frame_count_ == 1 then
				setPuttern( chara_, 60 )
			end
		end
		///////////////////////////////////////////////
		if getPhase(chara_)==1 then
			if frame_count_ == 1 then
				setPuttern( chara_, 60 )
				if getRank() == 3 then
					setInvincibleFrame(chara_,100)
				end
			end
			if frame_count_ == 3 then
				setPuttern( chara_, 61 )
			end
			if frame_count_ == 5 then 
				setPuttern( chara_, 62 )
			end
			if frame_count_ == 7 then 
				setPuttern( chara_, 63 )
			end
			if frame_count_ == 9 then 
				setPuttern( chara_, 64)
			end
			if frame_count_ == 11 then
				setPuttern( chara_, 65)
				setInvincibleFrame(chara_,100)
			end

			if frame_count_ ==13 then
				setPuttern( chara_, 108 )
				PlaySE("./Data/Sound/SE/warp.wav",100,120)
			end
			if frame_count_ ==15 then
				setPuttern( chara_, 109 )
			end
			if frame_count_ ==17 then 
				setPuttern( chara_,110 )
			end
			if frame_count_ ==19 then 
				setPuttern( chara_,111 )
			end
			if frame_count_ ==21 then 
				setPuttern( chara_,112)
			end
			if frame_count_ ==23 then 
				setPuttern( chara_,113 )
			end

			if frame_count_ ==27 then
				setPuttern( chara_, 120 )
			end
			if frame_count_ ==29 then
				setPuttern( chara_, 121 )
				PlaySE("./Data/Sound/SE/warp.wav",100,120)
			end
			if frame_count_ ==31 then 
				setPuttern( chara_,122 )
			end
			if frame_count_ ==33 then 
				setPuttern( chara_,123 )
			end
			if frame_count_ ==35 then 
				setPuttern( chara_,124)
			end
			if frame_count_ ==37 then 
				setPuttern( chara_,125 )
			end
		end		


    // �� �K�[�h
    elseif state_ == CHARASTATE_GUARD then
		if getPhase(chara_) == 0 then
			if frame_count_ == 1 then 
				setPuttern( chara_, 72)
			end
			if frame_count_ == 4 then 
				setPuttern( chara_, 73)
			end
			if frame_count_ >= 8 then 
				setPuttern( chara_, 74)
			end
		end
		if getPhase(chara_) == 1 then
			if frame_count_== 1 then
				setInvincibleFrame(chara_,15)		        	
				setPuttern( chara_, 6 )	
				PlaySE("./Data/Sound/SE/sword1.wav",100,200)	
				x, y = getCharaPosition( chara_ )
				if getDirection( chara_ ) == 1 then
					GrenadeGenerate(chara_,x+30,y+20,4,6,0.25,35,30,1,-20,5,100,30,10,10)
				else
					GrenadeGenerate(chara_,x-30,y+20,4,6,0.25,35,30,1,-20,5,100,30,10,10)
				end
			end
			if frame_count_== 2 then		        	
				setPuttern( chara_, 7 )				
			end
			if frame_count_== 4 then		        	
				setPuttern( chara_, 8 )				
			end
			if frame_count_== 6 then		        	
				setPuttern( chara_, 9 )				
			end
			if frame_count_ == 8 then 
				setPuttern( chara_, 84)
			end
			if frame_count_ ==11 then 
				setPuttern( chara_, 85)
			end
			if frame_count_ >=14 then 
				setPuttern( chara_, 86)
			end
		end
	//-------------------------------------------------------------
    // �� ���Ⴊ�݃K�[�h
    elseif state_ == CHARASTATE_SQGUARD then
		if getPhase(chara_) == 0 then
			if frame_count_ == 1 then 

				setPuttern( chara_, 84)
			end
			if frame_count_ == 4 then 
				setPuttern( chara_, 85)
			end
			if frame_count_ >= 8 then 
				setPuttern( chara_, 86)
			end
		end
/////////////////////hp�������ȉ��Ȃ�
		if getPhase(chara_)== 1 then
			if frame_count_ == 1 then 
				x, y = getCharaPosition( chara_ )
				PlaySE("./Data/Sound/SE/Powerup23.wav",100,100)
				GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
				setPuttern( chara_, 84)

			end
			if frame_count_ == 4 then 
				setPuttern( chara_, 85)
			end
			if frame_count_ >= 8 then 
				setPuttern( chara_, 86)
			end
		end
	//-------------------------------------------------------------
    // �� �͂����ҋ@
    elseif state_ == CHARASTATE_LADDER_WAIT then
		// �Ȃɂ����Ȃ��B���~���[�V�����~�߂�΂���

	//-------------------------------------------------------------
    // �� �͂������/�~�� �������[�V�����Ȃ̂œ���
    elseif state_ == CHARASTATE_LADDER_UP or
		state_ == CHARASTATE_LADDER_DOWN or
		state_ == CHARASTATE_LADDER_WAIT then

		setPuttern( chara_, 96 + frame_count_ / 10 )

		if frame_count_ == 19 then
			setFrameCount( chara_, -1 )
		end

	//-------------------------------------------------------------
    // �� �A�C�e���E��
    elseif state_ == CHARASTATE_ITENGET then

	//-------------------------------------------------------------
    // �� ���S
    elseif state_ == CHARASTATE_DEAD then

		//
		// �摜�\��
		// ������t���[��      : ( ����t���[��*�R�}�� ) -1
		// setPuttern ������ : ����t���[��
		//
		if frame_count_ <= 19 then
			setPuttern( chara_, 102 + frame_count_ / 4 ) 
			//
			// ����I���A������܂ōŌ�̃R�}��\��
			//
		elseif frame_count_ == 20 then
			setPuttern( chara_, 102 + 4 )
		end

		return
	

	//-------------------------------------------------------------
    // �� �ʏ�U�� 1 �i��
    elseif state_ == CHARASTATE_ATTACK_1 then
///////////////////////////////////////////////////////////////////////
		if getPhase(chara_)==0 then
		//
		// �摜�\��
		// ������t���[��      : ( ����t���[��*�R�}�� ) -1
		// setPuttern ������ : ����t���[��
		//
			if frame_count_== 1 then
				setInvincibleFrame(chara_,10)		        	
				setPuttern( chara_, 6 )	
				PlaySE("./Data/Sound/SE/sword1.wav",100,200)			
			end
			if frame_count_== 3 then		        	
				setPuttern( chara_, 7 )				
			end
			if frame_count_== 5 then		        	
				setPuttern( chara_, 8 )				
			end
			if frame_count_== 7 then		        	
				setPuttern( chara_, 9 )				
			end

			if frame_count_== 1 or
			   frame_count_== 3 or
			   frame_count_== 5 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	  4,   20,      5,    1.0,  1.0,    10 )
					end
				end
			end
			// �U���I���A���i�󂯕t��
			// frame_count_    : ����t���[��*�R�}��
			// �s�������̃��b�N���������A
			// �摜���t�H���[�X���[�̂��̂ɕύX�B
			//
			if frame_count_ ==8 then	
				AttackUnLock( chara_ )
			end
			//
			// �󂯕t�����ԏI��
			// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
			// �󂯕t���F�w��t���[����2�{
			//
			if frame_count_ == 22 then

				setCharaState( chara_, CHARASTATE_WAIT )
				setFrameCount( chara_, -1 )
			end
		end
//////////////////////////////////
		if getPhase(chara_)==1 then
		//
		// �摜�\��
		// ������t���[��      : ( ����t���[��*�R�}�� ) -1
		// setPuttern ������ : ����t���[��
		//
			if frame_count_== 1 then
				setInvincibleFrame(chara_,10)		        	
				setPuttern( chara_, 6 )	
				//PlaySE("./Data/Sound/SE/sword1.wav",100,200)		
				PlaySE("./Data/Sound/SE/Swordhit3.wav",80,170)	
			end
			if frame_count_== 3 then		        	
				setPuttern( chara_, 7 )				
			end
			if frame_count_== 5 then		        	
				setPuttern( chara_, 8 )				
			end
			if frame_count_== 7 then		        	
				setPuttern( chara_, 9 )				
			end

			if 	 frame_count_== 5 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 9,   20,      5,    1.0,  1.0,    10 )
					end
				end
			end
			// �U���I���A���i�󂯕t��
			// frame_count_    : ����t���[��*�R�}��
			// �s�������̃��b�N���������A
			// �摜���t�H���[�X���[�̂��̂ɕύX�B
			//
			if frame_count_ ==8 then	
				if Rand()%2 == 1 then
					setFrameCount( chara_, -1 )						
				else
					AttackUnLock( chara_ )
				end
			end
			//
			// �󂯕t�����ԏI��
			// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
			// �󂯕t���F�w��t���[����2�{
			//
			if frame_count_ == 22 then
				if Rand()%5 == 1 then
					setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
					setNum(chara_,1)
				else
					setCharaState( chara_, CHARASTATE_WAIT )
				end
					setFrameCount( chara_, -1 )
			end
		end

	//-------------------------------------------------------------
    // �� �ʏ�U�� 2 �i��
    elseif state_ == CHARASTATE_ATTACK_2 then

		if getPhase(chara_)==0 then
			//
			// �摜�\��
			// ������t���[��      : ( ����t���[��*�R�}�� ) -1
			// setPuttern ������ : ����t���[��
			//
			if frame_count_== 1 then
				setInvincibleFrame(chara_, 20)
				setPuttern( chara_, 18 )
			end

			if frame_count_ == 5 then
				setPuttern( chara_, 19 )
			end

			if frame_count_ ==9 then
				setPuttern( chara_,20 )
			end

			if frame_count_ ==12 then
				setPuttern( chara_,21 )
			end

			if frame_count_ ==18 then
				PlaySE("./Data/Sound/SE/sword1.wav",100,180)
				setPuttern( chara_, 22 )
			end

			if frame_count_ ==22 then
		 		setPuttern( chara_,23 )
			end
			if frame_count_>=12 and frame_count_<=20 then
				setVelocity( chara_,4, 0 )
			end
			if frame_count_==12 or
			   frame_count_==14 or
			   frame_count_==16 or
			   frame_count_==18 or
			   frame_count_==21 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	  5,   10,      5,    1.0,  1.0,    6 )
					end
				end
			end
			//
			// �U���I���A���i�󂯕t��
			// frame_count_    : ����t���[��*�R�}��
			// �s�������̃��b�N���������A
			// �摜���t�H���[�X���[�̂��̂ɕύX�B
			//
			if frame_count_ ==23 then	
				setPuttern( chara_, 30 )
				AttackUnLock( chara_ )
			end        
			//
			// �󂯕t�����ԏI��
			// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
			// �󂯕t���F�w��t���[����2�{
			//

			if frame_count_ == 33 then
				setCharaState( chara_, CHARASTATE_WAIT )
				setFrameCount( chara_, -1 )
			end
		end
///////////////////////////////////////////////////
		if getPhase(chara_)==1 then
			//
			// �摜�\��
			// ������t���[��      : ( ����t���[��*�R�}�� ) -1
			// setPuttern ������ : ����t���[��
			//
			if frame_count_== 1 then
				setInvincibleFrame(chara_, 20)
				setPuttern( chara_, 18 )
			end

			if frame_count_ == 4 then
				setPuttern( chara_, 19 )
			end

			if frame_count_ ==7 then
				setPuttern( chara_,20 )
			end

			if frame_count_ ==10 then
				PlaySE("./Data/Sound/SE/sword1.wav",100,80)
				x, y = getCharaPosition( chara_ )
				CreateEffect(0,x,y)
				setPuttern( chara_,21 )
			end

			if frame_count_ ==13 then
				setPuttern( chara_, 22 )
			end

			if frame_count_ ==16 then
		 		setPuttern( chara_,23 )
			end
			if frame_count_>=10 and frame_count_<=16 then
				setVelocity( chara_,8, 1 )
			end
			if frame_count_==10 or
			   frame_count_==14 or
			   frame_count_==18 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 10,   10,      5,    3.0,  3.0,    15 )
					end
				end
			end
			//
			// �U���I���A���i�󂯕t��
			// frame_count_    : ����t���[��*�R�}��
			// �s�������̃��b�N���������A
			// �摜���t�H���[�X���[�̂��̂ɕύX�B
			//
			if frame_count_ ==20 then	
				if Rand()%2 == 1 then
					setPuttern( chara_, 30 )
					setFrameCount( chara_, -1 )						
				else
					setPuttern( chara_, 30 )
					AttackUnLock( chara_ )
				end
			end        
			//
			// �󂯕t�����ԏI��
			// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
			// �󂯕t���F�w��t���[����2�{
			//

			if frame_count_ == 30 then
				if Rand()%5 == 1 then
					setPuttern( chara_, 30 )
					setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
					setNum(chara_,1)
				else
					setCharaState( chara_, CHARASTATE_WAIT )
				end

					setFrameCount( chara_, -1 )
			end
		end

	//-------------------------------------------------------------
    // �� �ʏ�U�� 3 �i��
    elseif state_ == CHARASTATE_ATTACK_3 then
		
		if getPhase(chara_)==0 then

			//
			// �摜�\��
			// ������t���[��      : ( ����t���[��*�R�}�� ) -1
			// setPuttern ������ : ����t���[��
			//
			if frame_count_== 1 then
				setInvincibleFrame(chara_, 15)
				setPuttern( chara_, 30 )
			end

			if frame_count_ == 3 then
				setPuttern( chara_, 31 )
			end

			if frame_count_ ==6 then
				setVelocity( chara_,30, 2 )			
				setPuttern( chara_,32 )
			end

			if frame_count_ ==12 then
				setPuttern( chara_,33 )
			end

			if frame_count_ ==16 then
				setPuttern( chara_, 34 )
			end

			if frame_count_ ==19 then
		 		setPuttern( chara_,35 )
			end


			if frame_count_==6 or
			   frame_count_==9 or
			   frame_count_==11 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 6,   20,      15,   16.0, 10.0,   60 )
					end
				end
			end

			if frame_count_==13 or
			   frame_count_==15 or
			   frame_count_==17 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 4,   20,      15,  16.0,  5.0,   15 )
					end
				end
			end
			//
			// �U���I���A���i�󂯕t��
			// frame_count_    : ����t���[��*�R�}��
			// �s�������̃��b�N���������A
			// �摜���t�H���[�X���[�̂��̂ɕύX�B
			//
			if frame_count_ ==35 then	
				AttackUnLock( chara_ )
			end        
			//
			// �󂯕t�����ԏI��
			// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
			// �󂯕t���F�w��t���[����2�{
			//

			if frame_count_ == 40 then
				setCharaState( chara_, CHARASTATE_WAIT )
				setFrameCount( chara_, -1 )
			end
		end
////////////////////////////////////////////////////////////
		if getPhase(chara_)==1 then
			//
			// �摜�\��
			// ������t���[��      : ( ����t���[��*�R�}�� ) -1
			// setPuttern ������ : ����t���[��
			//
			if frame_count_== 1 then
				setInvincibleFrame(chara_, 15)
				setPuttern( chara_, 30 )
			end

			if frame_count_ == 3 then
				setPuttern( chara_, 31 )
			end

			if frame_count_ ==6 then
				setVelocity( chara_,30, 2 )			
				setPuttern( chara_,32 )
				x, y = getCharaPosition( chara_ )
				CreateEffect(2,x + 10,y + 10)
			end

			if frame_count_ ==12 then
				setPuttern( chara_,33 )
				setVelocity( chara_,30, 2 )	
			end

			if frame_count_ ==16 then
				setPuttern( chara_, 34 )
				setVelocity( chara_,30, 2 )	
			end

			if frame_count_ ==19 then
		 		setPuttern( chara_,35 )
			end


			if frame_count_==9 or
			   frame_count_==17 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 13,   20,      15,   0.0, 20.0,   60 )
					end
				end
			end

			//
			// �U���I���A���i�󂯕t��
			// frame_count_    : ����t���[��*�R�}��
			// �s�������̃��b�N���������A
			// �摜���t�H���[�X���[�̂��̂ɕύX�B
			//
			if frame_count_ ==32 then	
				if Rand()%2 == 1 then

					setFrameCount( chara_, -1 )	
					if getDirection( chara_ ) == 1 then
						setDirection(chara_,2)
					else
						setDirection(chara_,1)
					end										
				else
					AttackUnLock( chara_ )
				end

			end        
			//
			// �󂯕t�����ԏI��
			// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
			// �󂯕t���F�w��t���[����2�{
			//

			if frame_count_ == 80 then
				if Rand()%5 == 1 then
					setPuttern( chara_, 30 )
					setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
					setNum(chara_,1)
				else
					setCharaState( chara_, CHARASTATE_WAIT )
				end
					setFrameCount( chara_, -1 )
			end
		end

	//-------------------------------------------------------------
    // �� �W�����v�U��
	elseif state_ == CHARASTATE_ATTACK_JUMP_ATTACK then
///////////////////hp��������
		if getPhase(chara_)==0 then
			//
			// �摜�\��
			// ������t���[��      : ( ����t���[��*�R�}�� ) -1
			// setPuttern ������ : ����t���[��
			//
			if frame_count_== 3 then
				setInvincibleFrame(chara_, 20)
				setPuttern( chara_, 66 )
				setVelocity( chara_,2, 6 )
				 PlaySE("./Data/Sound/SE/KATANA_attack.wav",70,100)
				 PlaySE("./Data/Sound/SE/sword1.wav",80,350)
			end

			if frame_count_ == 11 then
				setPuttern( chara_, 67 )
			end

			if frame_count_ == 14 then
				setPuttern( chara_,68 )
			end

			if frame_count_ == 18 then
				setPuttern( chara_,69 )
			end

			if frame_count_== 7 or
			   frame_count_== 11 or
			   frame_count_== 15 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 8,   10,      15,    8.0,  -12.0,   65 )
					end
				end
			end
			//
			// �U���I���A���i�󂯕t��
			// frame_count_    : ����t���[��*�R�}��
			// �s�������̃��b�N���������A
			// �摜���t�H���[�X���[�̂��̂ɕύX�B
			//
			if frame_count_ == 25 then	
				AttackUnLock( chara_ )
			end        
			//
			// �󂯕t�����ԏI��
			// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
			// �󂯕t���F�w��t���[����2�{
			//

			if frame_count_ == 30 then
				setCharaState( chara_, CHARASTATE_WAIT )
				setFrameCount( chara_, -1 )
			end
		end
//////////////////////hp�������ȉ��Ȃ�
		if getPhase(chara_)==1 then
///////////////////////////�Z1
			if getNum(chara_,0)==0 then
				//
				// �摜�\��
				// ������t���[��      : ( ����t���[��*�R�}�� ) -1
				// setPuttern ������ : ����t���[��
				//
				if frame_count_== 1 then
					setInvincibleFrame(chara_, 20)
					setPuttern( chara_, 66 )
					setVelocity( chara_,2, 12 )
					 PlaySE("./Data/Sound/SE/KATANA_attack.wav",70,100)
					 PlaySE("./Data/Sound/SE/sword1.wav",80,350)

				end

				if frame_count_ == 5 then
					setPuttern( chara_, 67 )
					x, y = getCharaPosition( chara_ )
				PlaySE("./Data/Sound/SE/shotgun.wav",40,110)
					if getDirection( chara_ ) == 1 then
						BulletGenerate(chara_,x,y + 20,6,-4,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,6,-2,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,6,-0.5,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,6,-6,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,0,-6,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,6,-1,10,1,1,8,2,20,60,7)
					else
						BulletGenerate(chara_,x,y + 20,-6,-4,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,-6,-2,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,-6,-0.5,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,-6,-6,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,0,-6,10,1,1,8,2,20,60,7)
						BulletGenerate(chara_,x,y + 20,-6,-1,10,1,1,8,2,20,60,7)
					end
				end

				if frame_count_ == 9 then
					setPuttern( chara_,68 )
				end

				if frame_count_ == 13 then
					setPuttern( chara_,69 )
				end

				if frame_count_== 6 then
				target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

				// �Ƃ肠�����G�ɍU��
       				 list = judgeAttackCollision( chara_, target_group )	
					if not ( list == nil ) then
						for i, target in ipairs( list ) do
							// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
							attackEffect( chara_, target,	 12,   10,      15,    8.0,  -12.0,   30 )
						end
					end
				end
				//
				// �U���I���A���i�󂯕t��
				// frame_count_    : ����t���[��*�R�}��
				// �s�������̃��b�N���������A
				// �摜���t�H���[�X���[�̂��̂ɕύX�B
				//
				if frame_count_ == 20 then	
					if Rand()%3 == 1 then
						setFrameCount( chara_, -1 )						
					else
						AttackUnLock( chara_ )
					end
				end        
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//

				if frame_count_ == 25 then
					if Rand()%3 == 1 then
						setCharaState( chara_, CHARASTATE_WAIT )
					else
						setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
						setNum(chara_,1)
					end
						setFrameCount( chara_, -1 )
				end			
			end
///////////////////////////�Z2					
			if getNum(chara_,0)==1 then
				if frame_count_ ==3 then
					setPuttern( chara_, 108 )
					PlaySE("./Data/Sound/SE/warp.wav",100,120)
				end
				if frame_count_ ==5 then
					setPuttern( chara_, 109 )
				end
				if frame_count_ ==7 then 
					setPuttern( chara_,110 )
				end
				if frame_count_ ==9 then 
					setPuttern( chara_,111 )
				end
				if frame_count_ ==11 then 
					setPuttern( chara_,112)
				end
				if frame_count_ ==13 then 
					setPuttern( chara_,113 )
				end


				if frame_count_ ==17 then
					setPuttern( chara_, 120 )
					x, y = getPlayerPos()
					setPosition(chara_,x,y+150)
				end
				if frame_count_ ==19 then
					setPuttern( chara_, 121 )
					PlaySE("./Data/Sound/SE/warp.wav",100,120)
				end
				if frame_count_ ==21 then 
					setPuttern( chara_,122 )
				end
				if frame_count_ ==23 then 
					setPuttern( chara_,123 )
				end
				if frame_count_ ==25 then 
					setPuttern( chara_,124)
				end
				if frame_count_ ==27 then 
					setPuttern( chara_,125 )
				end

				if frame_count_==29 then
					setInvincibleFrame(chara_, 20)
					setPuttern( chara_, 66 )
					setVelocity( chara_,0, -5 )
					 PlaySE("./Data/Sound/SE/KATANA_attack.wav",70,100)
					 PlaySE("./Data/Sound/SE/sword1.wav",80,350)
				end

				if frame_count_ ==31 then
					setPuttern( chara_, 67 )
				end

				if frame_count_ ==33 then
					setPuttern( chara_,68 )
				end

				if frame_count_ ==35 then
					setPuttern( chara_,69 )
				end		
				if frame_count_== 33 then
				target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

				// �Ƃ肠�����G�ɍU��
       				 list = judgeAttackCollision( chara_, target_group )	
					if not ( list == nil ) then
						for i, target in ipairs( list ) do
							// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
							attackEffect( chara_, target,	 8,   10,      15,    0.0,  -12.0,   8 )
						end
					end
				end
				//
				// �U���I���A���i�󂯕t��
				// frame_count_    : ����t���[��*�R�}��
				// �s�������̃��b�N���������A
				// �摜���t�H���[�X���[�̂��̂ɕύX�B
				//
				if frame_count_ == 34 then	
					if Rand()%5 == 0 then
						AttackUnLock( chara_ )
					else
						setFrameCount( chara_, 28 )
					end
				end        
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//

				if frame_count_ == 35 then
					if Rand()%3 == 1 then
						setCharaState( chara_, CHARASTATE_WAIT )
					else
						setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
						setNum(chara_,1)
					end
						setFrameCount( chara_, -1 )
				end		
			end
///////////////////////////�Z3
			if getNum(chara_,0)==2 then
				//
				// �摜�\��
				// ������t���[��      : ( ����t���[��*�R�}�� ) -1
				// setPuttern ������ : ����t���[��
				//
				if frame_count_== 1 then
					setInvincibleFrame(chara_, 20)
					setPuttern( chara_, 66 )
					setVelocity( chara_,5, -12 )
					 PlaySE("./Data/Sound/SE/KATANA_attack.wav",70,100)
					 PlaySE("./Data/Sound/SE/sword1.wav",80,350)
				end

				if frame_count_ == 5 then
					setPuttern( chara_, 67 )
				end

				if frame_count_ == 9 then
					setPuttern( chara_,68 )
				end

				if frame_count_ == 13 then
					setPuttern( chara_,69 )
				end
				if frame_count_ == 18 then
				 	if getDirection( chara_ ) == 1 then
						setDirection(chara_,2)
					else
						setDirection(chara_,1)
					end
				end

				if frame_count_ == 19 then
					setPuttern( chara_, 67 )
					setInvincibleFrame(chara_, 20)
					setVelocity( chara_,30, 2 )
					 PlaySE("./Data/Sound/SE/KATANA_attack.wav",70,100)
					 PlaySE("./Data/Sound/SE/sword1.wav",80,350)	
				end

				if frame_count_ == 23 then
					setPuttern( chara_,68 )
				end

				if frame_count_ == 25 then
					setPuttern( chara_,69 )
				end

				if frame_count_ == 30 then
				 	if getDirection( chara_ ) == 1 then
						setDirection(chara_,2)
					else
						setDirection(chara_,1)
					end
				end

				if frame_count_ == 31 then
					setPuttern( chara_, 67 )
					setInvincibleFrame(chara_, 20)
					setVelocity( chara_,8, 25 )
					 PlaySE("./Data/Sound/SE/KATANA_attack.wav",70,100)
					 PlaySE("./Data/Sound/SE/sword1.wav",80,350)	
				end

				if frame_count_ == 33 then
					setPuttern( chara_,68 )
				end

				if frame_count_ == 35 then
					setPuttern( chara_,69 )
				end


				if  frame_count_== 6 or
					frame_count_== 20 or
					frame_count_== 32 then
				target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

				// �Ƃ肠�����G�ɍU��
       				 list = judgeAttackCollision( chara_, target_group )	
					if not ( list == nil ) then
						for i, target in ipairs( list ) do
							// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
							attackEffect( chara_, target,	 14,   10,      15,    8.0,  -5.0,   35 )
						end
					end
				end
				//
				// �U���I���A���i�󂯕t��
				// frame_count_    : ����t���[��*�R�}��
				// �s�������̃��b�N���������A
				// �摜���t�H���[�X���[�̂��̂ɕύX�B
				//
				if frame_count_ == 36 then	
					if Rand()%3 == 1 then
						setFrameCount( chara_, -1 )						
					else
						AttackUnLock( chara_ )
					end
				end        
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//

				if frame_count_ == 50 then
					if Rand()%3 == 1 then

						setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
						setNum(chara_,1)
					else
						setCharaState( chara_, CHARASTATE_WAIT )
					end
						setFrameCount( chara_, -1 )
				end
			end	
///////////////////////////////////////////�Z4
			if getNum(chara_,0)==3 then

				if frame_count_ ==3 then
					setInvincibleFrame(chara_,30)
					setPuttern( chara_, 108 )
					PlaySE("./Data/Sound/SE/warp.wav",100,120)
				end
				if frame_count_ ==5 then
					setPuttern( chara_, 109 )
				end
				if frame_count_ ==7 then 
					setPuttern( chara_,110 )
				end
				if frame_count_ ==9 then 
					setPuttern( chara_,111 )
				end
				if frame_count_ ==11 then 
					setPuttern( chara_,112)
				end
				if frame_count_ ==13 then 
					setPuttern( chara_,113 )
				end

				if frame_count_ ==17 then
					setPuttern( chara_, 120 )
						x, y = getCharaPosition( chara_ )
						setPosition(chara_,x,y+Rand()%30)
				
				end
				if frame_count_ ==19 then
					setPuttern( chara_, 121 )
					PlaySE("./Data/Sound/SE/warp.wav",100,120)
				end
				if frame_count_ ==21 then 
					setPuttern( chara_,122 )
				end
				if frame_count_ ==23 then 
					setPuttern( chara_,123 )
				end
				if frame_count_ ==25 then 
					setPuttern( chara_,124)
				end
				if frame_count_ ==27 then 
					setPuttern( chara_,125 )
				end
				if frame_count_ ==29 then 
					setPuttern( chara_,24 )
				end

				if frame_count_ ==150 then 
					setVelocity(chara_ ,-5,0)
					x,y = getCharaPos(chara_)
					PlaySE("./Data/Sound/SE/gun01.wav",40,100)
					PlaySE("./Data/Sound/SE/warp.wav",100,120)
					if getDirection( chara_ ) == 1 then
						CreateEffect(2,x+35,y)						
						BulletGenerate(chara_,x,y + 20,8,0,7,1,1,2,2,3,90,7)
					else
						CreateEffect(2,x-15,y)	
						BulletGenerate(chara_,x,y + 20,-8,0,7,1,1,2,2,3,90,7)
					end
				end
				if frame_count_ ==39 then 
					setVelocity(chara_ ,-5,0)
					PlaySE("./Data/Sound/SE/gun01.wav",40,100)
					x, y = getCharaPosition( chara_ )
					if getDirection( chara_ ) == 1 then
						CreateEffect(2,x+35,y)						
						BulletGenerate(chara_,x,y + 20,8,0,8,1,1,4,2,3,90,7)
					else
						CreateEffect(2,x-15,y)	
						BulletGenerate(chara_,x,y + 20,-8,0,8,1,1,4,2,3,90,7)
					end
				end
				//
				// �U���I���A���i�󂯕t��
				// frame_count_    : ����t���[��*�R�}��
				// �s�������̃��b�N���������A
				// �摜���t�H���[�X���[�̂��̂ɕύX�B
				//
				if frame_count_ == 42 then	
					if Rand()%15 >= 1 then
						setVelocity(chara_ ,5,0)
						setFrameCount( chara_, 37 )	
						if getRank() == 3 then
							setInvincibleFrame(chara_,10)
						end					
					else
						AttackUnLock( chara_ )
					end
				end        
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//

				if frame_count_ == 65 then
					if Rand()%3 == 1 then

						setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
						setNum(chara_,1)
					else
						setCharaState( chara_, CHARASTATE_WAIT )
					end
					setFrameCount( chara_, -1 )
				end
			end
		end
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//-------------------------------------------------------------
    // �� ���Ⴊ�ݍU��
	elseif state_ == CHARASTATE_ATTACK_SQUAT_ATTACK then

		//hp�����ȏ�Ȃ�
		if getPhase(chara_) == 0 then
			//
			// �摜�\��
			// ������t���[��      : ( ����t���[��*�R�}�� ) -1
			// setPuttern ������ : ����t���[��
			//
			if frame_count_== 2 then
				setInvincibleFrame(chara_, 8)
				setPuttern( chara_, 42 )
			end

			if frame_count_ == 6 then
				setPuttern( chara_, 43 )
			end

			if frame_count_ == 10 then
				setPuttern( chara_,44 )
			end

			if frame_count_ ==26 then
				setInvincibleFrame(chara_,20)
				setPuttern( chara_,43 )
				PlaySE("./Data/Sound/SE/Explosion01.ogg",60,70)
			end
			if frame_count_ ==29 then
				setPuttern( chara_, 45 )
			end

			if frame_count_ ==36 then
				setPuttern( chara_, 46 )
			end

			if frame_count_ ==44 then
		 		setPuttern( chara_,47 )
			end

			if frame_count_==2 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 5,   10,      5,    0.0,  8.0,   30 )
					end
				end
			end

			if frame_count_==29 or
			   frame_count_==30 or
			   frame_count_==31 or
			   frame_count_==32 or
			   frame_count_==33 or
			   frame_count_==34 or
			   frame_count_==35 or
			   frame_count_==37 or
			   frame_count_==38 or
			   frame_count_==40 or
			   frame_count_==42 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 2,   50,      5,    0.0,  0.0,   1 )
						x, y = getCharaPosition( target )
						PlaySE("./Data/Sound/SE/sen_ge_bun04.wav",70,80)
						//CreateEffect(0,x-50+Rand()%100,y+Rand()%80)
						//CreateEffect(2,x-50+Rand()%100,y+Rand()%80)
						CreateEffect(3,x-50+Rand()%100,y+Rand()%80)
						CreateEffect(3,x-50+Rand()%100,y+Rand()%80)
					end
				end
			end

			if frame_count_==45 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 10,   10,      5,   15.0, 15.0,   30 )
					end
				end
			end
			//
			// �U���I���A���i�󂯕t��
			// frame_count_    : ����t���[��*�R�}��
			// �s�������̃��b�N���������A
			// �摜���t�H���[�X���[�̂��̂ɕύX�B
			//
			if frame_count_ ==46 then	
				AttackUnLock( chara_ )
			end        
			//
			// �󂯕t�����ԏI��
			// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
			// �󂯕t���F�w��t���[����2�{
			//

			if frame_count_ == 50 then
				setCharaState( chara_, CHARASTATE_WAIT )
				setFrameCount( chara_, -1 )
			end
		end
/////////////////////////////hp�����ȉ��Ȃ� 
		if getPhase(chara_)==1 then
///////////////////////////�Z1
			if getNum(chara_,0)==0 then
				//
				// �摜�\��
				// ������t���[��      : ( ����t���[��*�R�}�� ) -1
				// setPuttern ������ : ����t���[��
				//
				if frame_count_== 2 then
					setInvincibleFrame(chara_, 40)
					setPuttern( chara_, 42 )
				end

				if frame_count_ == 4 then
					setPuttern( chara_, 43 )
				end

				if frame_count_ == 8 then
					setPuttern( chara_,44 )
				end

				if frame_count_ ==13 then
					setInvincibleFrame(chara_,20)
					setPuttern( chara_,43 )
					PlaySE("./Data/Sound/SE/Explosion01.ogg",60,70)
				end
				if frame_count_ ==17 then
					setPuttern( chara_, 45 )

					x, y = getCharaPosition( chara_ )
					if getDirection( chara_ ) == 1 then
						BulletGenerate(chara_,x+5,y+10,-8,0,12,55,20,4,2,20,90,20)
						BulletGenerate(chara_,x+5,y+10,-5,1,20,55,20,5,4,20,90,20)
						BulletGenerate(chara_,x+5,y+10,-4,2,5,55,20,-2,5,20,90,20)
						BulletGenerate(chara_,x+5,y+10,-2,1.5,9,55,20,7,12,20,90,20)
						BulletGenerate(chara_,x+5,y+10,0,5,21,55,20,11,8,20,90,20)
						BulletGenerate(chara_,x+5,y+10,10,3,7,55,20,-4,-2,20,90,20)
						BulletGenerate(chara_,x+5,y+10,2,0,11,55,20,8,-8,20,90,20)
						BulletGenerate(chara_,x+5,y+10,8,2.5,6,55,20,0,9,20,90,20)
						BulletGenerate(chara_,x+5,y+10,3,10,20,55,20,5,-15,20,90,20)
						BulletGenerate(chara_,x+5,y+10,1,2,15,55,20,-2,0,20,90,20)
					else
						BulletGenerate(chara_,x+5,y+10,8,0,4,55,20,12,2,20,90,20)
						BulletGenerate(chara_,x+5,y+10,5,1,8,55,20,15,2,20,90,20)
						BulletGenerate(chara_,x+5,y+10,4,2,12,55,20,2,2,20,90,20)
						BulletGenerate(chara_,x+5,y+10,2,1.5,15,55,20,0,0,20,90,20)
						BulletGenerate(chara_,x+5,y+10,0,5,17,55,20,9,-8,20,90,20)
						BulletGenerate(chara_,x+5,y+10,-10,3,20,55,20,0,0,20,90,20)
						BulletGenerate(chara_,x+5,y+10,-2,0,24,55,20,0,20,20,90,20)
						BulletGenerate(chara_,x+5,y+10,-8,2.5,1,55,20,-12,8,20,90,20)
						BulletGenerate(chara_,x+5,y+10,-3,10,4,55,20,1,1,20,90,20)
						BulletGenerate(chara_,x+5,y+10,-1,2,11,55,20,20,1,20,90,20)
					end
				end

				if frame_count_ ==21 then
					setPuttern( chara_, 46 )

				end

				if frame_count_ ==25 then
		 			setPuttern( chara_,47 )
				end

				if frame_count_==21 then
				target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

				// �Ƃ肠�����G�ɍU��
       				list = judgeAttackCollision( chara_, target_group )	
					if not ( list == nil ) then
						for i, target in ipairs( list ) do
							// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
							attackEffect( chara_, target,	 15,   10,      5,   20.0, 20.0,   65 )
						end
					end
				end
				//
				// �U���I���A���i�󂯕t��
				// frame_count_    : ����t���[��*�R�}��
				// �s�������̃��b�N���������A
				// �摜���t�H���[�X���[�̂��̂ɕύX�B
				//
				if frame_count_ ==30 then	
					if Rand()%2 == 1 then
						AttackUnLock( chara_ )
					else
						setFrameCount( chara_, -1 )
						if getDirection( chara_ ) == 1 then
							setDirection(chara_,2)
						else
							setDirection(chara_,1)
						end
					end

				end        
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//

				if frame_count_ == 35 then
					if Rand()%3 == 1 then
						setCharaState( chara_, CHARASTATE_WAIT )
					else
						setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
						setNum(chara_,1)
					end
						setFrameCount( chara_, -1 )
				end
			end
//////////////////////////////�Z�Q
			if getNum(chara_,0)==1 then
				//
				// �摜�\��
				// ������t���[��      : ( ����t���[��*�R�}�� ) -1
				// setPuttern ������ : ����t���[��
				//
				if frame_count_== 2 then
					setInvincibleFrame(chara_, 8)
					setPuttern( chara_, 42 )
				end

				if frame_count_ == 6 then
					setPuttern( chara_, 43 )
				end

				if frame_count_ == 10 then
					setPuttern( chara_,44 )
				end

				if frame_count_ ==16 then
					setInvincibleFrame(chara_,20)
					setPuttern( chara_,43 )
					x, y = getCharaPosition( chara_)
					CreateEffect(4,x,y)
					PlaySE("./Data/Sound/SE/Explosion01.ogg",60,70)
				end
				if frame_count_ ==23 then
					setPuttern( chara_, 45 )
				end

				if frame_count_ ==31 then
					setPuttern( chara_, 46 )
					x, y = getCharaPosition( chara_)
					CreateEffect(4,x,y)
				end

				if frame_count_ ==43 then
		 			setPuttern( chara_,47 )

				end

				if frame_count_==2 then
				target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

				// �Ƃ肠�����G�ɍU��
       				 list = judgeAttackCollision( chara_, target_group )	
					if not ( list == nil ) then
						for i, target in ipairs( list ) do
							// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
							attackEffect( chara_, target,	 10,   10,      5,    0.0,  8.0,   20 )
						end
					end
				end

				if frame_count_==19 or
				   frame_count_==20 or
				   frame_count_==21 or
				   frame_count_==22 or
				   frame_count_==23 or
				   frame_count_==24 or
				   frame_count_==25 or
				   frame_count_==26 or
				   frame_count_==27 or
				   frame_count_==28 or
				   frame_count_==30 or
				   frame_count_==32 or
				   frame_count_==34 or
				   frame_count_==36 or
				   frame_count_==38 or
				   frame_count_==40 or
				   frame_count_==42 then
				target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

				// �Ƃ肠�����G�ɍU��
       				 list = judgeAttackCollision( chara_, target_group )	
					if not ( list == nil ) then
						for i, target in ipairs( list ) do
							// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
							attackEffect( chara_, target,	 2,   80,      1,    0.0,  0.0,   1 )
							x, y = getCharaPosition( target )
							PlaySE("./Data/Sound/SE/sen_ge_bun04.wav",70,80)
							CreateEffect(0,x-80+Rand()%160,y+Rand()%120)
							CreateEffect(2,x-80+Rand()%160,y+Rand()%120)
							CreateEffect(3,x-80+Rand()%160,y+Rand()%120)
							CreateEffect(3,x-80+Rand()%160,y+Rand()%120)
							CreateEffect(3,x-80+Rand()%160,y+Rand()%120)
							CreateEffect(3,x-80+Rand()%160,y+Rand()%120)
						end
					end
				end

				if frame_count_==44 then
				target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

				// �Ƃ肠�����G�ɍU��
       				 list = judgeAttackCollision( chara_, target_group )	
					if not ( list == nil ) then
						for i, target in ipairs( list ) do
							// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
							attackEffect( chara_, target,	 18,   10,      5,   20.0, 20.0,   70 )
						end
					end
				end
				//
				// �U���I���A���i�󂯕t��
				// frame_count_    : ����t���[��*�R�}��
				// �s�������̃��b�N���������A
				// �摜���t�H���[�X���[�̂��̂ɕύX�B
				//
				if frame_count_ ==45 then	
					AttackUnLock( chara_ )
				end        
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//

				if frame_count_ == 50 then
					if Rand()%3 == 1 then
						setCharaState( chara_, CHARASTATE_WAIT )
					else
						setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
						setNum(chara_,1)
					end
						setFrameCount( chara_, -1 )
				end
			end
//////////////////////////////�Z3
			if getNum(chara_,0)==2 then

				if frame_count_ ==1 and getRank()==0 then
					AttackUnLock( chara_ )
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end
				if frame_count_ ==1 and getRank()<=2 and Rand()%2==1 then
					AttackUnLock( chara_ )
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end

				if frame_count_ ==2 then
					setPuttern( chara_, 24 )
				end
				if frame_count_ ==45 then
					x, y = getCharaPosition( chara_)
					CreateEffect(4,x,y)
				end
				if frame_count_ ==50 then
					PlaySE("./Data/Sound/SE/Thunder01.wav",100,100)
					setPuttern( chara_, 24 )
				end
				if frame_count_ ==63 then
					setPuttern( chara_, 108 )
				end
				if frame_count_ ==65 then
					setPuttern( chara_, 109 )
				end
				if frame_count_ ==67 then 
					setPuttern( chara_,110 )
				end
				if frame_count_ ==69 then 
					setPuttern( chara_,111 )
				end
				if frame_count_ ==71 then 
					setPuttern( chara_,112)
				end
				if frame_count_ ==73 then 
					setPuttern( chara_,113 )
				x, y = getCharaPosition( chara_ )
				CreateEffect(0,x,y+100)	
				setPosition(chara_,x,y+1100,0)

				end
				if frame_count_ ==77 then
					setPuttern( chara_, 120 )
				end
				if frame_count_ ==79 then
					setPuttern( chara_, 121 )
				end
				if frame_count_ ==81 then 
					setPuttern( chara_,122 )
				end
				if frame_count_ ==83 then 
					setPuttern( chara_,123 )
				end
				if frame_count_ ==85 then 
					setPuttern( chara_,124)
				end
				if frame_count_ ==87 then 
					setPuttern( chara_,125 )
					x, y = getCharaPosition( chara_ )
					GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==95 then
					setPuttern( chara_,1 )
					x, y = getCharaPosition( chara_ )
					GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==100 then
					x, y = getCharaPosition( chara_ )
					GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==105 then
					x, y = getCharaPosition( chara_ )
					GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==110 then
					x, y = getCharaPosition( chara_ )
					GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==115 then
					x, y = getCharaPosition( chara_ )
					GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==120 then
					x, y = getCharaPosition( chara_ )
					GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==125 then
					x, y = getCharaPosition( chara_ )
					GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
				end

				if frame_count_ == 130 then	
					x, y = getCharaPosition( chara_ )
					x2,y2 =getCharaPosition( chara_ )
					GrenadeGenerate(chara_,x,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-100,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+200,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x+300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					GrenadeGenerate(chara_,x-300,y+30,0,4,0.1,35,30,1,-20,5,100,30,10,10)
					CreateEffect(0,x ,35)
					CreateEffect(0,x + 100,35)
					CreateEffect(0,x + 200,35)
					CreateEffect(0,x + 300,35)
					CreateEffect(0,x - 100,35)
					CreateEffect(0,x - 200,35)
					CreateEffect(0,x - 300,35)

				end        


				if frame_count_ == 200 then
					CreateEffect(0,x2 ,35)
					CreateEffect(0,x2 + 100,35)
					CreateEffect(0,x2 + 200,35)
					CreateEffect(0,x2 + 300,35)
					CreateEffect(0,x2 - 100,35)
					CreateEffect(0,x2 - 200,35)
					CreateEffect(0,x2 - 300,35)
					if Rand()%2 == 1 and getRank() == 3 then
						AttackUnLock( chara_ )
						setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
						setNum(chara_,1)
						setFrameCount( chara_, -1 )
					end
				end
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//
				 if frame_count_ == 450 then
					AttackUnLock( chara_ )
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end

			end
//////////////////////////////�Z4���@���t�@�[���T���_�[
			if getNum(chara_,0)==3 then

				if frame_count_ ==1 and getRank()==0 then
					AttackUnLock( chara_ )
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end
				if frame_count_ ==1 and getRank()==1 and Rand()%2==1 then
					AttackUnLock( chara_ )
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end

				if frame_count_ ==3 then
				setInvincibleFrame(chara_,250)
					setPuttern( chara_, 108 )
					PlaySE("./Data/Sound/SE/warp.wav",100,120)
				end
				if frame_count_ ==5 then
					setPuttern( chara_, 109 )
				end
				if frame_count_ ==7 then 
					setPuttern( chara_,110 )
				end
				if frame_count_ ==9 then 
					setPuttern( chara_,111 )
				end
				if frame_count_ ==11 then 
					setPuttern( chara_,112)
				end
				if frame_count_ ==13 then 
					setPuttern( chara_,113 )
				end

				if frame_count_ ==17 then
					setPuttern( chara_, 120 )

					setPosition(chara_,930,250)
				end
				if frame_count_ ==19 then
					setPuttern( chara_, 121 )
					PlaySE("./Data/Sound/SE/warp.wav",100,120)
				end
				if frame_count_ ==21 then 
					setPuttern( chara_,122 )
				end
				if frame_count_ ==23 then 
					setPuttern( chara_,123 )
				end
				if frame_count_ ==25 then 
					setPuttern( chara_,124)
				end
				if frame_count_ ==27 then 
					setPuttern( chara_,125 )
				end
				if frame_count_ ==30 then 
					setPuttern( chara_,38 )
					PlaySE("./Data/Sound/SE/warp.wav",100,50)
				end
				if frame_count_ ==32 then
					SetOpacity( chara_, 0.9 )
				end
				if frame_count_ ==34 then
					SetOpacity( chara_, 0.8 )
				end
				if frame_count_ ==36 then
					SetOpacity( chara_, 0.7 )
				end
				if frame_count_ ==38 then
					SetOpacity( chara_, 0.6 )
				end
				if frame_count_ ==40 then
					SetOpacity( chara_, 0.5 )
				end
				if getRank() <3 then
					if frame_count_ ==60 then
						x3 =650+(Rand()%600)
						CreateEffect(0,x3,35)
					end
					if frame_count_ ==80 then
						x4 =650+(Rand()%600)
						CreateEffect(0,x4,35)
					end
					if frame_count_ ==100 then
						x5,y5 =getPlayerPos()
						CreateEffect(0,x5,35)
					end
					if frame_count_ ==125 then
						CreateEffect(0,x3,35)
					end
					if frame_count_ ==140 then
						x, y = getCharaPosition( chara_ )
						CreateEffect(4,x,y)
						ThunderGenerate(chara_,x3,2000,100,15,100,-10,10,100,20,5)
					end
					if frame_count_ ==165 then
						CreateEffect(0,x4,35)
					end
					if frame_count_ ==180 then
						x, y = getCharaPosition( chara_ )
						CreateEffect(4,x,y)
						ThunderGenerate(chara_,x4,2000,100,15,100,-10,10,100,20,5)
					end
					if frame_count_ ==205 then
						CreateEffect(0,x5,35)
					end
					if frame_count_ ==220 then
						x, y = getCharaPosition( chara_ )
						CreateEffect(4,x,y)
						ThunderGenerate(chara_,x5,2000,100,15,100,-10,10,100,20,5)
					end
					if frame_count_ ==235 then
						SetOpacity( chara_, 0.6 )
						PlaySE("./Data/Sound/SE/warp.wav",100,50)
					end
					if frame_count_ ==237 then
						SetOpacity( chara_, 0.7 )
					end
					if frame_count_ ==239 then
						SetOpacity( chara_, 0.8 )
					end
					if frame_count_ ==241 then
						SetOpacity( chara_, 0.9 )
					end
					if frame_count_ ==243 then
						SetOpacity( chara_, 1 )
					end
					//
					// �󂯕t�����ԏI��
					// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
					// �󂯕t���F�w��t���[����2�{
					//
					 if frame_count_ == 280 then
						AttackUnLock( chara_ )
						setCharaState( chara_, CHARASTATE_WAIT )
						setFrameCount( chara_, -1 )
					end
				end
				if getRank() ==3 then
					if frame_count_ ==60 then
						if Rand()%3 == 1 then
							x3,y3 =getPlayerPos()
						else
							x3 =650+(Rand()%600)

						end
						CreateEffect(0,x3,35)
					end
					if frame_count_ ==90 then
						x, y = getCharaPosition( chara_ )
						CreateEffect(4,x,y)
						ThunderGenerate(chara_,x3,2000,100,15,100,-10,10,100,20,5)
					end
					if frame_count_ ==100 then
						if Rand()%5 > 0 then
							setFrameCount( chara_, 59 )
							setInvincibleFrame(chara_,70)
						end
					end
					if frame_count_ ==120 then
						SetOpacity( chara_, 0.6 )
						PlaySE("./Data/Sound/SE/warp.wav",100,50)
					end
					if frame_count_ ==122 then
						SetOpacity( chara_, 0.7 )
					end
					if frame_count_ ==124 then
						SetOpacity( chara_, 0.8 )
					end
					if frame_count_ ==126 then
						SetOpacity( chara_, 0.9 )
					end
					if frame_count_ ==128 then
						SetOpacity( chara_, 1 )
					end
					//
					// �󂯕t�����ԏI��
					// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
					// �󂯕t���F�w��t���[����2�{
					//
					 if frame_count_ == 130 then
						AttackUnLock( chara_ )
						//setCharaState( chara_, CHARASTATE_WAIT )
						//setFrameCount( chara_, -1 )
						if Rand()%2 == 1 then
							setCharaState( chara_, CHARASTATE_WAIT )
						else
							setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
							setNum(chara_,1)
						end
							setFrameCount( chara_, -1 )
					end
				end
			end
//////////////////////////////�Z5//////////////////********************************************************************************
			if getNum(chara_,0)==4 then

				if frame_count_ ==2 then 
					setPuttern( chara_,38 )
					PlaySE("./Data/Sound/SE/warp.wav",100,50)
					setInvincibleFrame(chara_,350)
				end
				if frame_count_ ==4 then
					SetOpacity( chara_, 0.9 )
				end
				if frame_count_ ==6 then
					SetOpacity( chara_, 0.8 )
				end
				if frame_count_ ==8 then
					SetOpacity( chara_, 0.7 )
				end
				if frame_count_ ==10 then
					SetOpacity( chara_, 0.6 )
				end
				if frame_count_ ==12 then
					SetOpacity( chara_, 0.5 )
				end
				if frame_count_ ==50 then
					bx,by =getPlayerPos()
					CreateEffect(4,bx,by)
				end
				if frame_count_ ==100 then
					bx,by =getPlayerPos()
					CreateEffect(4,bx,by)
				end
				if frame_count_ ==130 then
					CreateEffect(4,bx,by)
				end
				if frame_count_ >=150 and frame_count_ <=330 then
					tempx = Rand()%240
					tempy = Rand()%240
					tempbx =Rand()%30
					tempby =Rand()%30
					if getRank() == 2 and frame_count_%3 == 1 then
						CreateEffect(0,bx-120+tempx,by-120+tempy)
						CreateEffect(2,tempx,tempy)
						BulletGenerate(chara_,bx-120+tempx,by-120+tempy,-1.5+(tempbx/10),-1.5+(tempby/10),10,55,30,0,0,1,150+Rand()%100,15)
						PlaySE("./Data/Sound/SE/sen_ge_bun04.wav",105,70)
					end
					if getRank() == 3 then
						CreateEffect(0,bx-120+tempx,by-120+tempy)
						CreateEffect(2,tempx,tempy)
						BulletGenerate(chara_,bx-120+tempx,by-120+tempy,-1.5+(tempbx/10),-1.5+(tempby/10),20,55,30,0,0,1,140+Rand()%200,15)
						PlaySE("./Data/Sound/SE/sen_ge_bun04.wav",105,70)
					end
				end
				if frame_count_ ==340 then
					SetOpacity( chara_, 0.6 )
					PlaySE("./Data/Sound/SE/warp.wav",100,50)
				end
				if frame_count_ ==342 then
					SetOpacity( chara_, 0.7 )
				end
				if frame_count_ ==344 then
					SetOpacity( chara_, 0.8 )
				end
				if frame_count_ ==346 then
					SetOpacity( chara_, 0.9 )
				end
				if frame_count_ ==348 then
					SetOpacity( chara_, 1 )
				end
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//
					if frame_count_ == 370 then
					AttackUnLock( chara_ )
					//setCharaState( chara_, CHARASTATE_WAIT )
					//setFrameCount( chara_, -1 )
					if Rand()%2 == 1 then
						setCharaState( chara_, CHARASTATE_WAIT )
						setNum(chara_,0)
					else
						setCharaState( chara_,CHARASTATE_ATTACK_ANTIAIR_ATTACK)//���[�v 
						setNum(chara_,1)
					end
						setFrameCount( chara_, -1 )
				end
			end
		end


	//-------------------------------------------------------------
    // �� �΋�U��
	elseif state_ == CHARASTATE_ATTACK_ANTIAIR_ATTACK then
	//�̗͂������ȏ�
		if getPhase(chara_)==0 then
			//
			// �摜�\��
			// ������t���[��      : ( ����t���[��*�R�}�� ) -1
			// setPuttern ������ : ����t���[��
			//
			if frame_count_ ==1 then
				setPuttern( chara_, 57 )
			end
			if frame_count_== 7 then
				PlaySE("./Data/Sound/SE/Swordhit3.wav",100,120)
				setInvincibleFrame(chara_, 20)
				setPuttern( chara_, 54 )
			end

			if frame_count_ ==9 then
				setPuttern( chara_, 55 )
			end

			if frame_count_ ==11 then
				setPuttern( chara_,56 )
			end

			if frame_count_ == 13 then
				setPuttern( chara_,57 )
			end

			if frame_count_== 9 then
			target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

			// �Ƃ肠�����G�ɍU��
       			 list = judgeAttackCollision( chara_, target_group )	
				if not ( list == nil ) then
					for i, target in ipairs( list ) do
						// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
						attackEffect( chara_, target,	 16,   10,      15,    5.0, 40.0,   70 )
					end
				end
			end
			//
			// �U���I���A���i�󂯕t��
			// frame_count_    : ����t���[��*�R�}��
			// �s�������̃��b�N���������A
			// �摜���t�H���[�X���[�̂��̂ɕύX�B
			//
			if frame_count_ == 25 then	
				AttackUnLock( chara_ )
			end        
			//
			// �󂯕t�����ԏI��
			// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
			// �󂯕t���F�w��t���[����2�{
			//

			if frame_count_ == 26 then
				setCharaState( chara_, CHARASTATE_WAIT )
				setFrameCount( chara_, -1 )
			end
		end
///////////////////////////////////////////////////�̗͂������ȉ�
		if getPhase(chara_)==1 then
//////////////////////////////////////�Z�P
			if getNum(chara_,0)==0 then
				//
				// �摜�\��
				// ������t���[��      : ( ����t���[��*�R�}�� ) -1
				// setPuttern ������ : ����t���[��
				//
				if frame_count_ ==1 then
					setPuttern( chara_, 24 )
				end
				if frame_count_ ==31 then
					setPuttern( chara_, 57 )
				end
				if frame_count_== 37 then
					x, y = getCharaPosition( chara_)
					CreateEffect(4,x,y)
					PlaySE("./Data/Sound/SE/Swordhit3.wav",100,120)
					setInvincibleFrame(chara_, 20)
					setPuttern( chara_, 54 )
				end

				if frame_count_ ==39 then
					setPuttern( chara_, 55 )
				end

				if frame_count_ ==41 then
					setPuttern( chara_,56 )
				end

				if frame_count_ == 43 then
					setPuttern( chara_,57 )
				end

				if frame_count_== 39 then
				target_group = ( getCharaAttackedGroup( chara_ ) == ATKGROUP_PLAYER ) and ATKGROUP_ENEMY or ATKGROUP_PLAYER;

				// �Ƃ肠�����G�ɍU��
       				 list = judgeAttackCollision( chara_, target_group )	
					if not ( list == nil ) then
						for i, target in ipairs( list ) do
							// target ���U������		  damage  rand  critical  brow_x  brow_y  stun
							attackEffect( chara_, target,	 24,   10,      15,    0.0, 65.0,   100 )
							x, y = getCharaPosition( target )
							CreateEffect(1,x + 10,y + 10)
							PlaySE("./Data/Sound/SE/Explosion01.ogg",50,130)
						end
					end
				end
				//
				// �U���I���A���i�󂯕t��
				// frame_count_    : ����t���[��*�R�}��
				// �s�������̃��b�N���������A
				// �摜���t�H���[�X���[�̂��̂ɕύX�B
				//
				if frame_count_ == 45 then	
					AttackUnLock( chara_ )
				end        
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//

				if frame_count_ == 55 then
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end
			end
/////////////////////////////�Z�Q�@���[�v
			if getNum(chara_,0)== 1 then
				if frame_count_ ==3 then
				setInvincibleFrame(chara_,30)
					setPuttern( chara_, 108 )
					PlaySE("./Data/Sound/SE/warp.wav",100,120)
				end
				if frame_count_ ==5 then
					setPuttern( chara_, 109 )
				end
				if frame_count_ ==7 then 
					setPuttern( chara_,110 )
				end
				if frame_count_ ==9 then 
					setPuttern( chara_,111 )
				end
				if frame_count_ ==11 then 
					setPuttern( chara_,112)
				end
				if frame_count_ ==13 then 
					setPuttern( chara_,113 )
				end

				if frame_count_ ==17 then
					setPuttern( chara_, 120 )

					a =Rand()%5

					if a == 0 then
						setPosition(chara_,700,50)
					end
					if a == 1 then
						setPosition(chara_,930,50)
					end
					if a == 2 then
						setPosition(chara_,1200,50)
					end
					if a == 3 then
						setPosition(chara_,930,250)
					end
					if a == 4 then
						x, y = getPlayerPos()
						setPosition(chara_,x,y+150)
					end
				end
				if frame_count_ ==19 then
					setPuttern( chara_, 121 )
					PlaySE("./Data/Sound/SE/warp.wav",100,120)
				end
				if frame_count_ ==21 then 
					setPuttern( chara_,122 )
				end
				if frame_count_ ==23 then 
					setPuttern( chara_,123 )
				end
				if frame_count_ ==25 then 
					setPuttern( chara_,124)
				end
				if frame_count_ ==27 then 
					setPuttern( chara_,125 )
				end

				//
				// �U���I���A���i�󂯕t��
				// frame_count_    : ����t���[��*�R�}��
				// �s�������̃��b�N���������A
				// �摜���t�H���[�X���[�̂��̂ɕύX�B
				//
				if frame_count_ == 27 then	
					if Rand()%10 == 1 then
						SummonEnemy()
					end
					AttackUnLock( chara_ )
				end        
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//

				if frame_count_ == 27 then
				    setNum(chara_,Rand()%4)
					a = Rand()%5

					if a == 0 then
						setCharaState( chara_, CHARASTATE_ATTACK_JUMP_ATTACK )
					end
					if a == 1 then
						setCharaState( chara_, CHARASTATE_ATTACK_SQUAT_ATTACK )
					end
					if a == 2 then 
						setCharaState( chara_, CHARASTATE_ATTACK_ANTIAIR_ATTACK )
					end
					if a >= 3 then 
						setCharaState( chara_, CHARASTATE_WAIT )
					end
					if Rand()%50 == 1 and getRank() == 2 then
						setCharaState( chara_, CHARASTATE_ATTACK_SQUAT_ATTACK )
						setNum(chara_ ,4)
					end
					if Rand()%9 == 1 and getRank() == 3 then
						setCharaState( chara_, CHARASTATE_ATTACK_SQUAT_ATTACK )
						setNum(chara_ ,4)
					end
					if getRank() ==3 then
						setInvincibleFrame(chara_,30)
					end 
					setFrameCount( chara_, -1 )
				end
			end
/////////////////////////////�Z�R
			if getNum(chara_,0)== 2 then

				if frame_count_ == 1 and getRank()==1 then
					AttackUnLock( chara_ )
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end
				if frame_count_ ==3 then 
					setPuttern( chara_,38 )
					if getRank() == 3 then
						setFrameCount( chara_ ,80)
					end
				end
				//
				// �U���I���A���i�󂯕t��
				// frame_count_    : ����t���[��*�R�}��
				// �s�������̃��b�N���������A
				// �摜���t�H���[�X���[�̂��̂ɕύX�B
				//
				if frame_count_ ==120 then	
					if getRank() >=2 then
						x, y = getCharaPosition( chara_ )					
						Division(chara_,x,y)
						PlaySE("./Data/Sound/SE/machine_call.wav",100,100)
						CreateEffect(4,x,y)
					end
					AttackUnLock( chara_ )
				end        
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//

				if frame_count_ ==130 then
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end
			end
/////////////////////////////�Z4
			if getNum(chara_,0)== 3 then
				if frame_count_ ==1 and getRank()==0 then
					AttackUnLock( chara_ )
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end
				if frame_count_ ==1 and getRank()==1 and Rand()%2==1 then
					AttackUnLock( chara_ )
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end
				if frame_count_ ==3 then 
					setInvincibleFrame(chara_,100)
					setPuttern( chara_,84 )
				end
				if frame_count_ ==6 then 
					setPuttern( chara_,85 )
				end
				if frame_count_ ==9 then 
					setPuttern( chara_,86 )
				end
				if frame_count_ ==50 then 
					x,y =getPlayerPos()
					CreateEffect(0,x+12,y+100)
					PlaySE("./Data/Sound/SE/Powerup23.wav",100,100)
					GrenadeGenerate(chara_,x,y+90,0,0,0.05,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==70 then 
					x,y =getPlayerPos()
					CreateEffect(0,x+12,y+100)
					PlaySE("./Data/Sound/SE/Powerup23.wav",100,100)
					GrenadeGenerate(chara_,x,y+90,0,0,0.05,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==90 then 
					x,y =getPlayerPos()
					CreateEffect(0,x+12,y+100)
					PlaySE("./Data/Sound/SE/Powerup23.wav",100,100)

					GrenadeGenerate(chara_,x,y+90,0,0,0.05,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==110 then 
					setPuttern( chara_,38 )
					x,y =getPlayerPos()
					CreateEffect(0,x+12,y+100)
					PlaySE("./Data/Sound/SE/Powerup23.wav",100,100)
					GrenadeGenerate(chara_,x,y+90,0,0,0.05,35,30,1,-20,5,100,30,10,10)
				end
				if frame_count_ ==123 and getRank() == 3 then
					if Rand()%2 == 1 then
						setFrameCount( chara_, 109 )	
						setInvincibleFrame(chara_,40)
					end			
				end
				//
				// �󂯕t�����ԏI��
				// ���̒i�ւ̎󂯕t�����Ԃ𒴂�����ҋ@�ɂ���
				// �󂯕t���F�w��t���[����2�{
				//
				if frame_count_ ==150 then
					AttackUnLock( chara_ )
					setCharaState( chara_, CHARASTATE_WAIT )
					setFrameCount( chara_, -1 )
				end
			end
		end
	end
end

//=============================================================================
//                              end of file
//=============================================================================
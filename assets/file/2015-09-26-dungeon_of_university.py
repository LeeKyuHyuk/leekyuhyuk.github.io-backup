#-*- coding: utf-8 -*-

import random
import time

credit = 4.5
examNotice = False
giveup = False
turn = 0

def intro():
	print '새학기가 시작되어 수업에 들어왔다!'

def showCredit():
	print '학생의 예상 학점은 ' + str(credit) + '이다!'

def chooseSkill():
	global credit

	print '1. 공부하기'
	print '2. 잠자기'
	print '3. 밤샘'
	skillNumber = input('>> ')
	print '-----------------------------'
	if skillNumber == 1:
		print '학생의 공부하기!'
		time.sleep(1)
		if random.randint(0, 1) == 1:
			print '효과는 뛰어났다!'
			credit += 0.1
		else:
			print '효과는 조금 부족한 듯 하다.'

	if skillNumber == 2:
		print '학생의 잠자기!'
		time.sleep(1)
		print '학생은 잠들어버렸다!'
		time.sleep(1)
		print '태도 점수가 감점되었다!'
		credit -= 0.1

	if skillNumber == 3:
		print '학생은 밤을 새워 페이스북을 했다!'
		time.sleep(1)
		print '아무 일도 일어나지 않았다.'
	print '-----------------------------'

def professorSkill():
	global credit
	global examNotice
	global giveup
	global turn
	
	print '============================='
	if examNotice == False:
		if turn < 5:
			skillNumber = random.randint(1, 3)
			if skillNumber == 1:
				print '교수님의 영어수업!'
				time.sleep(1)
				print '학생의 멘탈이 붕괴되었다!'
				credit -= 0.2

			if skillNumber == 2:
				print '교수님의 쪽지시험!'
				time.sleep(1)
				credit -= 0.1

			if skillNumber == 3:
				print '교수님의 과제!'
				time.sleep(1)
				credit -= 0.2
		else:			
			print '<< 교수님은 중간고사를 공지했다 >>'
			time.sleep(2)
			examNotice = True
	else:
		print '교수님의 중간고사!'
		time.sleep(1)
		print '효과는 뛰어났다!'
		credit -= 1.5
		giveup = True
	turn += 1
	print '============================='

def end():
	showCredit()
	print '학생은 지니고 있던 장학금을 잃어버렸다!'
	time.sleep(1)
	print '학생은 녹색병에 든 액체를 마셨다.'
	time.sleep(1)
	print '시야가 흐려진다...'

intro()
while giveup == False:
	showCredit()
	chooseSkill()
	professorSkill()
end()

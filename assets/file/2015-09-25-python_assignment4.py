#-*- coding: utf-8 -*-
import random

number = random.randint(1, 31)
guessNumber = 0
chance = 5

print '컴퓨터가 1부터 31의 숫자 중 하나를 골랐습니다! 맞춰보세요!'
print '총 ' + str(chance) + '번의 기회가 있습니다.'

while chance != 0:
	guessNumber = input()
	if number > guessNumber:
		print str(guessNumber) + '보다 큰 숫자를 말해보세요.'
	if number < guessNumber:
		print str(guessNumber) + '보다 작은 숫자를 말해보세요.'
	if number == guessNumber:
		print '잘하셨어요! 정답은 숫자 ' + str(number) + '이었습니다.'
		break
	chance -= 1
if number != guessNumber:
	print '기회를 모두 사용해버렸습니다.'
	print '정답은 ' + str(number) + '이었습니다.'

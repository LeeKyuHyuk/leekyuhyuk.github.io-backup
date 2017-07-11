---
layout: post
title:  "Calculus II Practice (1)"
date:   2017-07-11 22:14:58 +0900
category: Calculus-2
---

**Find all the polar coordinates of the point.**

***Q1)*** $$(6, \frac{ \pi }{ 4 })$$

***A1)***

$$k=1,2,3, \cdots$$ 일때,

$$(6,\frac{ \pi }{4} \pm 2k \pi) , (-6,\frac{ 5 \pi }{4}  \pm 2k \pi)$$

---

**Find the polar coordinates, $$0 \leq  \theta  \leq 2 \pi$$ and $$r \geq 0$$, of the point given in Cartesian coordinates.**

***Q2)*** $$(\frac{ 1 }{ 6 }, \frac{ - \sqrt{ 3 } }{ 6 })$$

***A2)***

- r의 값을 구할때는 피타고라스의 법칙을 사용합니다.  ( $$r= \sqrt{ x^{2} + y^{2} }$$ )

$$r = \sqrt{ (\frac{ 1 }{ 6 })^{2} + (\frac{ - \sqrt{ 3 } }{ 6 })^{2} }$$

$$= \sqrt{ \frac{ 4 }{ 36 } }$$

$$= \sqrt{ \frac{ 1 }{ 9 } }$$

$$ \therefore r = \frac{ 1 }{ 3 } $$

- 이제 $$ \theta $$를 구합니다. ($$tan^{-1}  (\frac{y}{x})$$)

$$  \theta =  tan^{-1}  (\frac{ \frac{- \sqrt{3} }{6} }{ \frac{1}{6} }) $$

$$ = tan^{-1} (-\sqrt{3}) $$

$$ \therefore \theta = - \frac{ \pi }{3} $$

- 하지만 $$( \frac{1}{3} , - \frac{ \pi }{3} )$$은 답이 아니다. 범위가 $$0 \leq  \theta  \leq 2 \pi$$ 이기 때문이다. $$\theta$$의 값인 $$- \frac{ \pi }{3}$$에 $$2\pi$$를 더하면 $$(- \frac{ \pi }{3})+\frac{ 6\pi }{3} = \frac{ 5 \pi }{3}$$

$$ \therefore (\frac{1}{3} , \frac{ 5 \pi }{3}) $$

---

**Find the slope of the polar curve at the indicated point.**

***Q3)*** $$r=4cos3\theta$$, $$\theta=\frac{ 5 \pi }{6}$$

***A3)***

$$ \frac{dr}{d \theta } = -12sin3 \theta$$

$$ \frac{dy}{dx} =  \frac{ \frac{dr}{d \theta } sin \theta +rcos \theta }{\frac{dr}{d \theta } cos \theta - rsin \theta } $$

$$ =  \frac{-12sin3 \theta \times sin \theta + 4cos3 \theta \times cos \theta }{-12sin3 \theta \times cos  \theta - 4cos3 \theta \times sin \theta } $$

$$ = \frac{-3sin3 \theta \times sin \theta + cos3 \theta \times cos \theta }{-3sin3 \theta \times cos  \theta - cos3 \theta \times sin \theta } $$

$$ = \frac{-3sin \frac{5 \pi }{2}  \times sin  \frac{5 \pi }{6}  + cos \frac{5 \pi }{2}  \times cos  \frac{5 \pi }{6}  }{-3sin \frac{5 \pi }{2}  \times cos   \frac{5 \pi }{6}  - cos \frac{5 \pi }{2}  \times sin  \frac{5 \pi }{6}  } $$

$$ = \frac{-3 \times 1 \times  \frac{1}{2} + 0  \times -  \frac{ \sqrt{3} }{2}  }{-3 \times 1 \times   -  \frac{ \sqrt{3} }{2} - 0 \times \frac{1}{2} } $$

$$ =  \frac{ \frac{-3}{2} }{ \frac{3 \sqrt{3} }{2} } $$

$$ = \frac{-3}{3 \sqrt{3} } $$

$$ = \frac{-1}{ \sqrt{3} } $$

$$ = \frac{- \sqrt{3}}{ 3 } $$

$$ \therefore \frac{dy}{dx} = \frac{- \sqrt{3}}{ 3 }$$

<br>

***Q4)*** $$r= \frac{6}{ \theta } $$, $$\theta=3 \pi $$

***A4)***

- ( $$\theta$$를 $$x$$라고 생각한다. )

$$ \frac{dr}{d \theta } = ( \frac{6}{ \theta })' =  \frac{f'g-fg'}{  g^{2}  } = \frac{0 \times  \theta - 6 \times 1}{   \theta ^{2}  } $$

$$ = -  \frac{6}{  \theta ^{2} } $$

$$ \frac{dy}{dx} =  \frac{ \frac{dr}{d \theta } sin \theta +rcos \theta }{\frac{dr}{d \theta } cos \theta - rsin \theta } $$

$$ =  \frac{ ( - \frac{6}{ \theta ^{2}} ) sin \theta +  ( \frac{6}{ \theta } ) cos \theta }{ ( - \frac{6}{ \theta ^{2}} )cos \theta - ( \frac{6}{ \theta } )sin \theta } $$

$$ =  \frac{ ( - \frac{6}{9  \pi ^{2}} ) sin \theta +  ( \frac{6}{ 3 \pi } ) cos \theta }{ ( - \frac{6}{9  \pi ^{2}} )cos \theta - ( \frac{6}{ 3 \pi } )sin \theta } $$

$$ =  \frac{ ( - \frac{2}{3  \pi ^{2}} ) sin 3 \pi +  ( \frac{2}{ \pi } ) cos 3 \pi  }{ ( - \frac{2}{3  \pi ^{2}} )cos 3 \pi - ( \frac{2}{ \pi } )sin 3 \pi } $$

- ( $$ sin 3 \pi = 0 $$, $$ cos 3 \pi = -1 $$ )

$$ = \frac{ - \frac{2}{\pi} }{ \frac{2}{3 \pi^{2}} } $$

$$ =  \frac{-6 \pi^{2}}{2 \pi} $$

$$ = -3 \pi $$

$$ \therefore \frac{dy}{dx} = -3 \pi $$

---

**Solve the problem.**

***Q7)*** Find the point on the curve $$ x=3sin(t) $$, $$ y=cos(t)$$, $$ - \frac{\pi}{2} \leq t \leq \frac{\pi}{2} $$ closest to the point $$ ( \frac{4}{3} , 0 ) $$

(Hint: Minimize the square of the distance as a function of $$ t $$.)

***A7)***

$$ D^{2} = ( 3sin(t) -  \frac{4}{3} )^{2} + (cos(t) - 0 )^{2} $$

$$ = 9sin^{2}(t) - 8sin(t) + \frac{16}{9} + cos^{2}(t) $$

$$ = 8sin^{2}(t) - 8sin(t) + \frac{16}{9} + cos^{2}(t) + sin^{2}(t) $$

- $$ sin^{2}(t) + cos^{2}(t) = 1 $$

$$ = 8sin^{2}(t) - 8sin(t) + \frac{25}{9} $$

$$ = 8 (sin^{2}(t)-sin(t)+ \frac{1}{4} ) -2 +  \frac{25}{9} $$

$$ = 8 (sin(t) - \frac{1}{2} )^{2} +  \frac{7}{9} $$

$$ sin (t) = \frac{1}{2} $$ $$ 이므로, $$ $$t =  \frac{\pi}{6}  $$

$$ x = 3sin (\frac{\pi}{6}) = \frac{3}{2} $$

$$ y = cos (\frac{\pi}{6}) = \frac{ \sqrt{3} }{2} $$

$$ \therefore ( \frac{3}{2} , \frac{ \sqrt{3} }{2} ) $$

---

**Find the value of $$ d^{2}y/dx^{2} $$ at the point defined by the given value of $$ t $$.**

***Q8)*** $$ x = t + cos(t) $$, $$ y = 2 - sin(t) $$, $$ t = \frac{\pi}{6} $$

***A8)***

$$ \frac{d^{2}y}{dx^{2}} = \frac{d}{dx} ( \frac{dy}{dx} ) = \frac{d}{dx} (y') = \frac{dy'}{dx} = \frac{dy'/dt}{dx/dt} $$

$$ \frac{dx}{dt} = 1-sin(t) $$

$$ \frac{dy}{dt} = -cos(t) $$

$$ \frac{dy}{dx} =  \frac{-cos(t)}{1-sin(t)}  $$

$$ \frac{dy'}{dt} =  \frac{sin(t) \times (1-sin(t))-(-cos(t))(-cos(t))}{(1-sin(t))^{2}} =  \frac{ \frac{1}{2} \times ( 1 - \frac{1}{2} ) - ( - \frac{ \sqrt{3} }{2} ) \times ( - \frac{ \sqrt{3} }{2} ) }{( 1 - \frac{1}{2} )^{2}} = -2 $$

$$ \therefore \frac{d^{2}y}{dx^{2}} = \frac{dy'/dt}{dx/dt} = \frac{-2}{1- sin( \frac{\pi}{6}) } = \frac{-2}{1- \frac{1}{2} } = 4$$

---

**Find the area.**

***Q9)*** Find the area of the region between the curve $$ x=e^{4t} $$, $$ y= \frac{1}{4} e^{-3t} $$ and the x-axis, $$ 0 \leq t \leq ln^{9} $$

***A9)***

$$ A =  \int_a^b f(x) dx $$

$$ = \int_0^{ln^{9}} ( \frac{1}{4} e^{-3t})(4e^{4t}dt) $$

$$ = \int_0^{ln^{9}} e^{t} dt $$

$$ = e^{ln^{9}} - e^{0} = 9 - 1 = 8 $$

$$ \therefore 8 $$

---

**Find the length of the curve.**

***Q10)*** $$ x=2sin(t)-2t \ cos(t) $$, $$ y=2cos(t)+2t \ sin(t) $$, $$ 0 \leq t \leq  \frac{\pi}{4} $$

***A10)***

$$ L =  \int_a^b \sqrt{( \frac{dx}{dt} )^{2}+( \frac{dy}{dt} )^{2}} dt $$

$$ \frac{dx}{dt} = 2cos(t) - ( 2 \times cos(t) + 2t \times - sin(t) ) = 2t \ sin(t) $$

$$ \frac{dy}{dt} = -2sin(t) + ( 2 \times sin(t) + 2t \times 2t cos(t) ) = 2t \ cos(t) $$

$$ L =  \int_0^{\frac{\pi}{4}} \sqrt{( 2t \ sin(t))^{2}+( 2t \ cos(t) )^{2}} dt $$

$$ =  \int_0^{\frac{\pi}{4}} \sqrt{ 4t^{2}( sin^{2}(t)+ cos^{2}(t))} dt $$

- $$ sin^{2}(t)+ cos^{2}(t) = 1 $$

$$ =  \int_0^{\frac{\pi}{4}} 2t \ dt $$

$$ =  ({\frac{\pi}{4}})^{2} - 0^{2}  $$

$$ \therefore \frac{\pi^{2}}{16} $$

---

**The eccentricity is given of a conic section with one focus at the origin, along with the directrix corresponding to that focus. Find a polar equation for the conic section.**

***Q11)*** $$ e=5 $$, $$ x=4 $$

***A11)***

$$ 5 = \frac{r}{4-x} $$

- $$ x = r \ cos \theta $$

$$ 5 = \frac{r}{4- r \ cos \theta} $$

$$ 5(4- r \ cos \theta) = r $$

$$ 20 - 5r \ cos \theta = r $$

$$ 20 = r (1 + 5 \ cos \theta) $$

$$ \therefore r = \frac{20}{1 + 5 \ cos \theta} $$

<br>

***Q12)*** $$ e=\frac{1}{2} $$, $$ x=9 $$

***A12)***

$$ \frac{1}{2} = \frac{r}{9-x} $$

$$ \frac{1}{2} = \frac{r}{9-r \ cos \theta} $$

$$ 9 - r \ cos \theta = 2r $$

$$ r ( 2 + cos \theta ) = 9 $$

$$ \therefore r = \frac{9}{2+cos \theta} $$

---

**Find the distance between points $$ P_{1} $$ and $$ P_{2} $$.**

***Q13)*** $$ P_{1} (5, -9, 10) $$ and $$ P_{2} (15, 1, 15) $$

***A13)***

$$ D =  \sqrt{(5-15)^{2}+(-9-1)^{2}+(10-15)^{2}} =  \sqrt{225} = 15 $$

$$ \therefore D = 15 $$

---

**Find an equation for the sphere with the given center and radius.**

***Q14)*** Center $$ (-3, 10, 0) $$, radius = $$ 5 $$

***A14)***

Center $$ (h, k, l) $$, Radius = r

Equation: $$ (x-h)^{2} + (y-k)^{2} + (z-l)^{2} = r^{2} $$

$$ \therefore (x+3)^{2} + (y-10)^{2} + z^{2} = 25 $$

---

**Find the magnitude.**

***Q15)*** Let $$ u = < 2, -2 > $$ and $$ v = < 4, 5 > $$. Find the magnitude (length) of the vector: $$ -2u - v $$.

***A15)***

$$ -2u - v = < -2u_{x} -v_{x}, -2u_{y} -v_{y} > = < -4 -4 , \ 4 -5 > = < -8, -1 > $$

magnitude (length) $$ -2u - v $$ : $$  \sqrt{(-8)^{2}+(-1)^{2}} = \sqrt{ 65 }$$

$$ \therefore \sqrt{ 65 } $$

---

**Solve the problem.**

***Q16)*** Find a vector of magnitude $$ 9 $$ in the direction of $$ v = 12i - 5k $$.

***A16)***

$$ \overrightarrow{v} =  \sqrt{(12)^{2}+(-5)^{2}} = \sqrt{169} = 13 $$

$$ \frac{ \overrightarrow{v} }{ |\overrightarrow{v} |} = \frac{12}{13} i - \frac{5}{13} k $$

$$ \overrightarrow{P} = \frac{12 \times 9 }{13} i - \frac{5 \times 9 }{13} k $$

$$ \therefore \overrightarrow{P} = \frac{108}{13} i - \frac{45}{13} k $$

---

**Find $$ v \cdot u $$.**

***Q17)*** $$ v=( \frac{1}{ \sqrt{3} }, \frac{1}{ \sqrt{11} } ) $$ and $$ u=( \frac{1}{ \sqrt{3} }, \frac{-1}{ \sqrt{11} } ) $$

***A17)***

$$ v \cdot u = (v_{x} \times u_{x}) + (v_{y} \times u_{y}) $$

$$ = ( \frac{1}{ \sqrt{3}} \times \frac{1}{ \sqrt{3}} ) + ( \frac{1}{ \sqrt{11}} \times \frac{-1}{ \sqrt{11}} ) $$

$$ = \frac{1}{3} - \frac{1}{11} = \frac{8}{33} $$

$$ \therefore \frac{8}{33} $$

---

**Find the vector $$ proj_{v}u $$.**

***Q18)*** $$ v = 3i - j + 3k $$, $$u = 11i + 2j + 10k $$

***A18)***

$$ proj_{v}u = ( \frac{ \overrightarrow{v} \cdot \overrightarrow{u} }{ \overrightarrow{v} \cdot \overrightarrow{v} } ) \overrightarrow{v} $$

$$ = \frac{(3)(11) + (-1)(2) + (3)(10)}{(3)(3) + (-1)(-1) + (3)(3)} (3i-j+3k) $$

$$ = \frac{61}{19} (3i-j+3k) $$

$$ \therefore \frac{183}{19}i - \frac{61}{19}j + \frac{183}{19}k $$

---

**Find the length and direction (when defined) of $$ u \times v $$.**

***Q19)*** $$ u= - \frac{1}{2} i + \frac{3}{2} j+k $$, $$ v=i+j+2k $$

***A19)***

$$ u = < - \frac{1}{2}, \frac{3}{2}, 1> $$, $$ v = < 1, 1, 2 > $$

$$ \begin{bmatrix}i & j & k & i & j \\ -\frac{1}{2} & \frac{3}{2} & 1 & -\frac{1}{2} & \frac{3}{2} \\ 1 & 1 & 2 & 1 & 1 \end{bmatrix} $$

$$ = [ ( \frac{3}{2} \times 2 )i + (1 \times 1 )j + ( -\frac{1}{2} \times 1)k] - [( \frac{3}{2} \times 1 )k + (1 \times 1 )i + ( -\frac{1}{2} \times 2)j] $$

$$ = 2i + 2j - 2k $$

Length : $$ \sqrt{2^{2}+2^{2}+(-2)^{2}}  = \sqrt{12} = 2 \sqrt{3} $$

Direction : $$ \frac{2(i+j-k)}{2 \sqrt{3} } =  \frac{i+j-k}{\sqrt{3} } $$

$$ \therefore $$ Length is $$ 2 \sqrt{3} $$ , Direction is $$ \frac{i+j-k}{\sqrt{3} } $$

---

**Find the triple scalar product $$ ( u \times v ) \cdot w $$ of the given vectors.**

***Q20)*** $$ u = -5i - 3j + 4k $$ , $$ v = 2i - 6j + 6k $$, $$ w = 3i - 7j - 9k $$

***A20)***

$$ ( u \times v ) = $$ $$ \begin{bmatrix}i & j & k & i & j \\ -5 & -3 & 4 & -5 & -3 \\ 2 & -6 & 6 & 2 & -6 \end{bmatrix} $$

$$ = [ (-3 \times 6 )i + (4 \times 2)j + (-5 \times -6)k ] - [ (-3 \times 2)k + (4 \times -6)i + (-5 \times 6)j] $$

$$ = 6i + 38j + 36k $$

$$ ( u \times v ) \cdot w = < 6, 38, 36 > < 3, -7, -9 > $$

$$ = (6 \times 3) + (38 \times -7) + (36 \times -9) = 18 - 266 - 324 = -572 $$

$$ \therefore -572 $$


---

**Find parametric equations for the line described below.**

***Q21)*** The line through the point $$ P(-4,5,-1) $$ parallel to the vector $$ -7i + 8j - 7k $$

***A21)***

$$ < x+4, y-5, z+1 > = t< -7, 8, -7 > $$

$$ \therefore $$ $$ x=-4-7t $$, $$ y=5+8t $$, $$ z=-1-7t $$, $$ t = $$ any real number.

---

**Write the equation for the plane.**

***Q22)*** The plane through the point $$ P(-3,7,3) $$ and normal to $$ n = 5i + 8j + 8k $$.

***A22)***

$$ < x+3, y-7, z-3 > \cdot < 5, 8, 8 > = 0 $$

$$ (x+3)(5) + (y-7)(8) + (z-3)(8) = 0 $$

$$ 5x + 15 + 8y - 56 + 8z -24 = 0 $$

$$ \therefore 5x + 8y + 8z = 65 $$

---

**Calculate the requested distance.**

***Q23)*** The distance from the point $$ S(2,2,-5) $$ to the plane $$ 2x + 2y + z = -4 $$.

***A23)***

$$ Distance = | <a-2, b-2, c+5> | $$

$$ <a-2, b-2, c+5> = t<2, 2, 1>$$

$$ a=2+2t $$, $$ b=2+2t $$, $$ c=-5+t$$

- 위에서 구한 $$ a $$, $$ b $$, $$ c $$를 $$ 2x + 2y + z = -4 $$에 넣습니다.

$$ 2(2+2t) + 2(2+2t) + (-5+t) = -4 $$

$$ \therefore t = - \frac{7}{9}  $$

$$ \therefore Distance = | t <2, 2, 1 > | \Rightarrow | - \frac{7}{9} <2, 2, 1 > | $$

$$ = \frac{7}{9}  \sqrt{2^{2}+2^{2}+1^{2}} $$

$$ = \frac{7}{3} $$

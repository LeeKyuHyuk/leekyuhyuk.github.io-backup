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

---

**Find the specific function value.**

***Q27)*** Find $$ f(3, 6) $$ when $$ f(x, y) =  \sqrt{3x+y^{2}} $$

***A27)***

$$ f(3, 6) =  \sqrt{3(3) + (6)^{2}}  =  \sqrt{45}  $$

$$ \therefore 3 \sqrt{5} $$

<br>

***Q28)*** Find $$ f(4, 0, 9) $$ when $$ f(x, y, z) = 4x^{2} + 4y^{2} - z^{2} $$

***A28)***

$$ f(4, 0, 9) = 4(4)^{2}+4(0)^{2}-(9)^{2} = 64 + 0 - 81 $$

$$ \therefore -17 $$

---

**Provide an appropriate response.**

***Q29)*** Find the extrema of $$ f(x, y, z) = x + yz $$ on the line defined by $$ x = 4(4 + t) $$, $$ y = t - 4 $$, and $$ z = t + 4 $$. Classify each extremum as a minimum or maximum. (Hint: $$ w = f(x, y, z) $$ is a
differentiable function of $$ t $$.)

***A29)***

$$ f(x, y, z) = x + yz = 4(4+t) + (t-4)(t+4) = t^2 + 4t $$

$$ f'(t) = 2t +4 = 0 $$

$$ t = -2 $$

$$ minimum : ( \ 4(4+(-2)), (-2)-4, (-2)+4\ ) $$

$$ \therefore minimum : (8, -6, 2) $$

---

**Find the limit.**

***Q30)***  $$ \lim_{(x,y) \rightarrow (0,0)}  \frac{9x^{2} + 9y^{2} + 9}{9x^{2}-9y^{2}+6} $$

***A30)*** $$  \lim_{(x,y) \rightarrow (0,0)}  \frac{9x^{2} + 9y^{2} + 9}{9x^{2}-9y^{2}+6} = \frac{9(0)^{2} + 9(0)^{2} + 9}{9(0)^{2}-9(0)^{2}+6} = \frac{9}{6}$$

$$ \therefore \frac{3}{2} $$

<br>

***Q31)***  $$ \lim_{(x,y) \rightarrow (3,5)}   \sqrt{ \frac{1}{xy} } $$

***A31)*** $$  \lim_{(x,y) \rightarrow (3,5)}   \sqrt{ \frac{1}{xy} }  =  \sqrt{ \frac{1}{(3)(5)} } $$

$$ \therefore \sqrt{ \frac{1}{15} } $$

<br>

***Q32)***  $$ \lim_{(x,y) \rightarrow (0,1)}  \frac{y^{4}sinx}{x} $$

***A32)*** $$  \lim_{(x,y) \rightarrow (0,1)}  \frac{y^{4}sinx}{x} = \lim_{x \rightarrow 0}  \frac{sinx}{x} \times \lim_{y \rightarrow 1}  y^{4} = 1 $$

$$ \therefore 1 $$

---

**Find $$ \frac{ \delta f}{ \delta x } $$ and $$ \frac{ \delta f}{ \delta y } $$.**

***Q33)***  $$ f(x,y) = \frac{x}{x+y} $$

***A33)***

$$ \frac{ \delta f}{ \delta x } = \frac{1 \times (x+y)-x \times (1+0)}{(x+y)^{2}} = \frac {y}{(x+y)^{2}} $$

$$ \frac{ \delta f}{ \delta y } = \frac{0 \times (x+y)-x \times (0+1)}{(x+y)^{2}} = \frac {-x}{(x+y)^{2}} $$

---

**Find $$ f_{x} $$, $$ f_{y} $$, and $$ f_{z} $$.**

***Q34)***  $$ f(x,y,z) = \frac{z}{ \sqrt{x+y^{2}}} $$

***A34)***

$$ f_{x} = \frac{0 \times ( \sqrt{x+y^{2}} ) - z ( \frac{1}{2} ( x+y^{2} )^{ - \frac{1}{2}}(1)}{( \sqrt{x+y^{2}} )^{2}} $$

$$ =  \frac{ \frac{1}{2} \times -z \times  \frac{1}{ \sqrt{x+y^{2}} }  }{x+y^{2}} =  \frac{ \frac{-z}{2 \sqrt{x+y^{2}} } }{x+y^{2}} $$

$$ \therefore f_{x} =  \frac{-z}{2(x+y^{2}) \sqrt{x+y^{2}} }  $$

$$ f_{y} = \frac{0 \times ( \sqrt{x+y^{2}} ) - z ( \frac{1}{2} ( x+y^{2} )^{ - \frac{1}{2}}(2y)}{( \sqrt{x+y^{2}} )^{2}} $$

$$ =  \frac{ \frac{1}{2} \times -z \times  \frac{2y}{ \sqrt{x+y^{2}} }  }{x+y^{2}} =  \frac{ \frac{-2yz}{2 \sqrt{x+y^{2}} } }{x+y^{2}} =  \frac{-2yz}{2(x+y^{2}) \sqrt{x+y^{2}} } $$

$$ \therefore f_{y} =  \frac{-yz}{(x+y^{2}) \sqrt{x+y^{2}} }  $$

$$ f_{z} = \frac{1 \times ( \sqrt{x+y^{2}} ) - z ( \frac{1}{2} ( x+y^{2} )^{ - \frac{1}{2}}(0)}{( \sqrt{x+y^{2}} )^{2}} $$

$$ \therefore f_{z} =  \frac{ \sqrt{x+y^{2}}}{x+y^{2} }  $$

<br>

***Q35)***  $$ f(x,y,z) = \frac{cos \ y}{ xz^{2}} $$

***A35)***

$$ f_{x} =  \frac{0 \times (xz^{2}) - cos \ y(z^{2})}{(xz^{2})^{2}} =  \frac{-z^{2}cos \ y}{(xz^{2})^{2}} $$

$$ \therefore f_{x} =  \frac{-cos \ y}{x^{2}z^{2}}  $$

$$ f_{y} =  \frac{-sin \ y \times (xz^{2}) - cos \ y(0)}{(xz^{2})^{2}} =  \frac{-xz^{2}sin \ y}{(xz^{2})^{2}} $$

$$ \therefore f_{y} =  \frac{-sin \ y}{xz^{2}}  $$

$$ f_{z} =  \frac{0 \times (xz^{2}) - cos \ y(2xz)}{(xz^{2})^{2}} =  \frac{-2xz \times cos \ y}{(xz^{2})^{2}} $$

$$ \therefore f_{z} =  \frac{-2cos \ y}{xz^{3}}  $$

---

**Solve the problem.**

***Q36)***  Evaluate $$ \frac{dw}{dt} $$ at $$ t = \frac{7}{2} \pi $$ for the function $$ w = \frac{xy}{z} $$, $$ x = sin \ t $$, $$ y = cos \ t $$, $$ z = t^{2} $$.

***A36)***

$$ \frac{dw}{dt} = \frac{dw}{dx} \times \frac{dx}{dt} + \frac{dw}{dy} \times \frac{dy}{dt} + \frac{dw}{dz} \times \frac{dz}{dt} $$

$$ = \frac{(y)(z) - (xy \times 0) }{z^{2}} \times cos \ t + \frac{(x)(z) - (xy \times 0) }{z^{2}} \times -sin \ t + \frac{(0)(z) - (xy \times 1) }{z^{2}} \times 2t $$

$$ = \frac{(yz) cos \ t - (xz)sin \ t - (xy) \ 2t}{z^{2}} $$

$$ = \frac{cos \frac{7}{2} \pi \times (\frac{7}{2} \pi)^{2} \times  cos \ \frac{7}{2} \pi - sin \frac{7}{2} \pi \times  sin \frac{7}{2} \pi \times \frac{7}{2} \pi - sin \frac{7}{2} \pi \times cos \frac{7}{2} \pi \times  \ 2(\frac{7}{2} \pi)}{(\frac{7}{2} \pi)^{4}} $$

- $$ sin \frac{7}{2} \pi = -1 $$, $$ cos \frac{7}{2} \pi = 0 $$

$$ = \frac{-1}{(\frac{7}{2} \pi)^{2}} $$

$$\therefore \frac{-4}{49 \pi^{2}}$$

<br>

***Q37)***  Evaluate $$ \frac{ \delta u} { \delta x} $$ at $$ (x,y,z)=(4,5,2) $$ for the function $$ u = p^{2} - q^{2} - r $$, $$ p = xy $$, $$ q = y^{2} $$, $$ r = xz $$.

***A37)***

$$ \frac{\delta u}{\delta x} = \frac{\delta u}{\delta p} \times \frac{\delta p}{\delta x} + \frac{\delta u}{\delta q} \times \frac{\delta q}{\delta x} + \frac{\delta u}{\delta r} \times \frac{\delta r}{\delta x} $$

$$ = (2p) \times (y) + (-2q) \times (0) + (-1)(z) = 2py - z $$

$$ = 2 \times x \times y \times y \times -z = 2 \times 4 \times 5 \times 5 \times (-2) $$

$$ \therefore 198 $$

---

**Provide an appropriate answer.**

***Q38)***  Find $$ \frac{ \delta w} { \delta r} $$ when $$ r = -1 $$ and $$ s = -3 $$ if $$ w(x, y, z) = xz + y^2 $$, $$ x = 2r + 1 $$, $$ y = r + s $$, and $$ z = r - s $$.

***A38)***

$$ \frac{\delta w}{\delta r} = \frac{\delta w}{\delta x} \times \frac{\delta x}{\delta r} + \frac{\delta w}{\delta y} \times \frac{\delta y}{\delta r} + \frac{\delta w}{\delta z} \times \frac{\delta z}{\delta r} $$

$$ = (z) \times (2) + (2y) \times (1) + (x)(1) = 2z + 2y + x $$

$$ = 2(r-s) + 2(r+s) + (2r+1) = 4-8-1 $$

$$ \therefore -5 $$

---

**Find the derivative of the function at $$ P_{0} $$ in the direction of u.**

***Q40)***  $$ f(x, y) = 9x^{2} + 2y $$, $$ P_{0} (-7, -9) $$, $$ u = 3i - 4j $$

***A40)***

$$ \triangledown f = < 18x, 2 > $$

$$ \triangledown f $$ at $$ ( -7, -9 ) $$ = $$ < 18(-7), 2 > \ \Rightarrow \ < -126, 2 >$$

$$ < -126, 2> \cdot \frac{<3, -4>}{|<3, -4>|} $$

- $$ <3, -4> $$은 $$ u = 3i - 4j $$에서 얻는다.

$$ = \frac{(-126)(3)+(2)(-4)}{ \sqrt{3^{2} + 4^{2}} } $$

$$ \therefore \frac{-386}{5} $$

<br>

***Q41)***  $$ f(x, y, z) = -10x - 9y + 8z $$, $$ P_{0} (-8, 7, 3) $$, $$ u = 3i - 6j - 2k $$

***A41)***

$$ \triangledown f = < -10, -9, 8 > $$

$$ \triangledown f $$ at $$ (-8, 7, 3) $$ = $$ < -10, -9, 8 > $$

$$ < -10, -9, 8 > \cdot \frac{<3, -6, -2>}{|<3, -6, -2>|} $$

$$ = \frac{(-10)(3)+(-9)(-6)+(8)(-2)}{ \sqrt{3^{2} + (-6)^{2} + (-2)^{2}} } $$

$$ \therefore \frac{8}{7} $$

---

**Find all the second order partial derivatives of the given function.**

***Q42)***  $$ f(x, y) = x \ ln^{(y - x)} $$

***A42)***

$$ f_{x} = (1) \times ln^{(y-x)} + (x) \times (\frac{1}{y-x}) \times (-1) $$

$$ \therefore f_{x} = ln^{(y-x)} + \frac{-x}{y-x} $$

$$ \therefore f_{y} = \frac{x}{y-x} $$

$$ f_{xx} = \frac{-1}{y-x} + \frac{(1) \times (y-x) - (-x)(-1)}{(y-x)^{2}} $$

$$ \therefore f_{xx} = \frac{-2y+x}{(y-x)^{2}} $$

$$ \therefore f_{yy} = \frac{-x}{(y-x)^{2}} $$

$$ \therefore f_{xy} = \frac{4}{(y-x)^{2}} $$

<br>

***Q43)***  $$ f(x, y) = \frac{x}{x+y} $$

***A43)***

$$ f_{x} = \frac{(1)(x+y)-(x)(1)}{(x+y)^{2}} = \frac{y}{(x+y)^{2}}$$

$$ f_{y} = \frac{(0)(x+y)-(x)(1)}{(x+y)^{2}} = \frac{-x}{(x+y)^{2}}$$

$$ f_{xx} = \frac{(0)(x+y)^{2} - (y) \times 2(x+y)}{(x+y)^{4}} = \frac{-2y}{(x+y)^{3}} $$

$$ f_{yy} = \frac{(0)(x+y)^{2} - (-x) \times 2(x+y)}{(x+y)^{4}} = \frac{2x}{(x+y)^{3}} $$

$$ f_{xy} = \frac{(1)(x+y)^{2} - (y) \times 2(x+y)}{(x+y)^{4}} = \frac{x-y}{(x+y)^{3}} $$

---

**Provide an appropriate response.**

***Q45)***  Find any local extrema (maxima, minima, or saddle points) of $$ f(x, y) $$ given that $$ f_{x} = -10x + 7y $$ and $$ f_{y} = 7x - 5y $$.

***A45)***

$$ f_{xx} = -10 $$, $$ f_{yy} = -5 $$, $$ f_{xy} = 7 $$

$$ D(x,y) = f_{xx}(x,y) \times f_{yy}(x,y) - f_{xy}(x,y)^{2} $$

$$ = (-10)(-5)-(7)^{2} $$

$$ \therefore D = 1 $$

$$ \therefore f_{xx} = -10 $$

- $$ D > 0 $$ & $$ f_{xx} < 0 $$ $$  \rightarrow  $$ LMAX at $$ (a,b) $$
- $$ D > 0 $$ & $$ f_{xx} > 0 $$ $$  \rightarrow  $$ LMIN at $$ (a,b) $$
- $$ D < 0 $$ $$ \rightarrow $$ neither max nor min at $$ (a,b) $$
- $$ D = 0 $$ $$ \rightarrow $$ test tells as nothing.

$$ \therefore $$ LMAX at $$ (x,y) $$ = $$ (0,0) $$

- $$ (0,0) $$ 부분은 $$ f_{x} $$ 와 $$ f_{y} $$를 사용하여 $$ x $$, $$ y $$를 구하여 좌표를 알아낼 수 있다.

<br>

***Q46)***  Determine whether the function $$ f(x,y) = 4x^{2}y^{2}+7x^{4}y^{4} $$ has a maximum, a minimum, or neither at the origin.

***A46)***

$$ f_{x} = 8xy^{2}+28^{3}y^{4} $$, $$ f_{y} = 8x^{2}y+28x^{4}y^{3} $$

$$ f_{xx} = 8y^{2}  + 84x^{2}y^{4}$$, $$ f_{yy} = 8x^{2}+84x^{4}y^{2}$$

$$ f_{xy} = 16xy + 112x^{3}y^{3}$$

$$ D(x,y) = f_{xx}(0,0) \times f_{yy}(0,0) - f_{xy}(0,0)^{2} $$

$$ \therefore D = 0 $$

$$ \therefore $$ test tells as nothing

---

**Solve the problem.**

***Q47)***  Find the point on $$ 3x+5y+7z=1 $$ that is closest to the origin.

***A47)***

$$ f(x,y,z) = x^{2} + y^{2} + z^{2} $$, $$ g(x,y,z) = 3x+5y+7z-1=0 $$

$$  \triangledown f =  \lambda \triangledown g $$

$$ <2x, 2y, 2z> = \lambda <3,5,7> $$

$$ x = \frac{3}{2}  \lambda $$, $$ y = \frac{5}{2}  \lambda $$, $$ z = \frac{7}{2}  \lambda $$

위에서 구한 $$ x $$, $$ y $$, $$ z $$를 $$ 3x+5y+7z=1 $$에 대입하면,

$$ 3 ( \frac{3}{2}  \lambda ) +5( \frac{5}{2}  \lambda )+7( \frac{7}{2}  \lambda )=1 $$

$$ \frac{83}{2}  \lambda = 1 $$

$$ \lambda = \frac{2}{83}$$

$$ \therefore (x,y,z) = (\frac{3}{83},\frac{5}{83},\frac{7}{83}) $$

<br>

***Q48)***  The planes  $$ 3x + 5y = 1 $$ and $$ 5y + 7z = 1 $$ intersect in a line. Find the point on that line closest to the origin.

***A48)***

$$ f(x,y,z) = x^{2} + y^{2} + z^{2} $$, $$ g(x,y,z) = 3x + 5y - 1=0 $$, $$ h(x,y,z) = 5y + 7z - 1=0 $$

$$  \triangledown f =  \lambda \triangledown g + \mu  \triangledown h $$

$$ <2x, 2y, 2z> = \lambda <3,5,0> + \mu <0,5,7> $$

- 나머지는 ***Q47*** 를 참고하여, $$ \lambda $$와 $$ \mu $$를 구한뒤, 대입하여 좌표를 알아내면 된다.

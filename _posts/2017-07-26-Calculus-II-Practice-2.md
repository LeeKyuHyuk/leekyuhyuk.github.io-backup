---
layout: post
title:  "Calculus II Practice (2)"
date:   2017-07-26 00:42:18 +0900
category: Calculus-2
---

**Evaluate the integral.**

***Q1)*** $$ \int_{0}^{4\pi} \int_{0}^{5\pi} (sin \ x + cos \ y) dx dy $$

***A1)***

$$ \Rightarrow \ \int_{0}^{5\pi} (sin \ x + cos \ y) dx $$

$$ = (-cos \ 5\pi + 5\pi cos \ y) - ( - cos \ 0 + 0cos \ y ) $$

$$ = -cos \ \pi + 5\pi \ cos \ y - ( -1) $$

$$ = 5\pi \ cos \ y + 2 $$

$$ \Rightarrow \ \int_{0}^{4\pi} (5\pi \ cos \ y + 2) dy $$

$$ = (5\pi \ sin \ 4\pi + 8\pi) - (5\pi \ sin \ 0 + 0) $$

$$ \therefore 8\pi $$

<br>

***Q2)*** $$ \int_{1}^{3} \int_{0}^{y} x^{2}y^{2} dx dy $$

***A2)***

$$ \Rightarrow \  \int_{0}^{y} x^{2}y^{2} dx $$

$$ =  \frac{1}{3} y^{5} $$

$$ \Rightarrow \ \int_{1}^{3} (\frac{1}{3} y^{5}) dy $$

$$ = \frac{1}{18}(3^{6}-1^{6}) = \frac{1}{18}(729-1) = \frac{728}{18} $$

$$ \therefore \frac{364}{9} $$

<br>

***Q3)*** $$ \int_{0}^{1} \int_{0}^{y} e^{x+y} dx dy $$

***A3)***

$$ \Rightarrow \  \int_{0}^{y} e^{x+y} dx $$

$$ =  e^{2y} - e^{y} $$

$$ \Rightarrow \ \int_{0}^{1} e^{2y} - e^{y} dy $$

$$ = (\frac{1}{2}e^{2}-e^{1})-(\frac{1}{2}e^{0}-e^{0}) $$

$$ = \frac{1}{2}e^{2}-e+\frac{1}{2} $$

$$ \therefore \frac{1}{2}(e-1)^2

---

**Change the Cartesian integral to an equivalent polar integral, and then evaluate.**

***Q4)*** $$ \int_{-7}^{7} \int_{0}^{ \sqrt{49-x^{2}} } dy dx $$

***A4)***

$$ -7 \leq x \leq 7 $$, $$ 0 \leq y \leq  \sqrt{49-x^{2}} $$

$$  \Rightarrow y=\sqrt{49-x^{2}} $$

$$  y^{2}=49-x^{2} $$

$$  x^{2}+y^{2}=49 $$

$$  0 \leq r \leq 7 $$

$$ \Rightarrow \ \int_{0}^{\pi} \int_{0}^{7} rdrd \theta  $$

$$ = (\frac{1}{2}7^{2})-(\frac{1}{2}0^{2}) = \frac{49}{2} $$

$$  \Rightarrow \ \int_{0}^{\pi} \frac{49}{2} d \theta $$

$$ \therefore \frac{49}{2} \pi $$

<br>

***Q5)*** $$  \int_{-7}^{0} \int_{- \sqrt{49-x^{2}} }^{0} \frac{1}{ 1 + \sqrt{x^{2}+y^{2}} }dy dx $$

***A5)***

$$ -7 \leq x \leq 0 $$, $$ -\sqrt{49-x^{2}} \leq y \leq  0 $$

$$  \Rightarrow y=\sqrt{49-x^{2}} $$

$$  y^{2}=49-x^{2} $$

$$  x^{2}+y^{2}=49 $$

$$  0 \leq r \leq 7 $$, $$  \pi \leq \theta \leq \frac{3}{2}\pi $$

$$ \Rightarrow \ \int_{\pi}^{\frac{3}{2}\pi} \int_{0}^{7} \frac{r}{1+r} drd \theta  $$

$$ = \int_{0}^{7} \frac{1+r-1}{1+r} dr$$

$$ = \int_{0}^{7} 1-\frac{1}{1+r} dr$$

$$ = (7-ln^{1+7}) - (0-ln^{1+0}) = (7-ln^{8}) $$

$$  \Rightarrow \ \int_{\pi}^{\frac{3}{2}\pi} (7-ln^{8}) d \theta $$

$$ = (7-ln^{8})(\frac{3}{2}\pi-\pi) $$

$$ \therefore \frac{1}{2} \pi (7-ln^{8})  $$

<br>

***Q6)*** $$  \int_{-4}^{4} \int_{- \sqrt{16-y^{2}} }^{0} \frac{ \sqrt{x^{2}+y^{2}}}{ 1 + \sqrt{x^{2}+y^{2}} }dx dy $$

***A6)***

$$ - \sqrt{16-y^{2}} \leq x \leq 0 $$, $$ -4 \leq y \leq  4 $$

$$ \Rightarrow \ \int_{\frac{\pi}{2}}^{\frac{3}{2}\pi} \int_{0}^{4} \frac{r^{2}}{1+r} drd \theta  $$

$$ = \int_{0}^{4} ( r-1+\frac{1}{1+r}) dr $$

$$ = (\frac{1}{2} \times 4^{2} - 4 + ln^{4+1}) - (\frac{1}{2} \times 0^{2} - 0 + ln^{0+1}) $$

$$ = 4 + ln^{5} $$

$$  \Rightarrow \int_{\frac{\pi}{2}}^{\frac{3}{2}\pi} 4 + ln^{5} d \theta $$

$$ \therefore (4 + ln^{5}) \pi $$

---

**Use the given transformation to evaluate the integral.**

***Q21)*** $$ u = x + y $$, $$ v = -2x + y $$

$$ {\int \int } 4x dx dy $$

$$ \ \ R $$

where $$R$$ is the parallelogram bounded by the lines $$ y = -x + 1 $$, $$ y = -x + 4 $$, $$ y = 2x + 2 $$, $$ y = 2x + 5 $$

***A21)***

$$ u = x + y $$, $$ v = -2x + y $$

$$ 1 \leq u \leq 4 $$, $$ 2 \leq v \leq 5 $$

$$ y = u - x = v + 2x $$

$$ \Rightarrow x = \frac{1}{3}(u-v) $$

$$ x = u - y = -\frac{1}{2}v+\frac{1}{2}y $$

$$ \frac{3}{2}y = u + \frac{1}{2}v $$, $$ y = \frac{2}{3}u + \frac{1}{3}v $$

$$ dxdy =  \mid  \mid  \begin{bmatrix} \frac{1}{3} & -\frac{1}{2}  \\ \frac{2}{3}  &  \frac{1}{3}  \end{bmatrix}  \mid  \mid dudv = \frac{1}{3}dudv$$

$$ \Rightarrow  \int_2^5 \int_1^4 \frac{4}{3}(u-v)\frac{1}{3}dudv $$

$$ = \frac{4}{9} \int_2^5 \int_1^4 u-v \ dudv $$

$$ = \frac{4}{9} \int_2^5 (\frac{15}{2}-3v) dv $$

$$ = \frac{4}{9} (\frac{15}{2} \times 3 - \frac{3}{2} \times 21) $$

$$ \therefore -4 $$

---

**If r(t) is the position vector of a particle in the plane at time t, find the indicated vector.**

***Q24)*** Find the velocity vector.

$$ r(t) = (-3t^{2} - 12) i + (\frac{1}{21}t^{3})j $$

***A24)***

Velocity Vector:

$$ = \overrightarrow{ r' } (t) = < x'(t), y'(t), z'(t) > $$

$$ x'(t) = -6t $$, $$ y'(t) = \frac{1}{7}t^{2} $$

$$ \therefore \ < -6t, \ \frac{1}{7}t^{2} > $$

<br>

***Q25)*** Find the acceleration vector.

$$ r(t) = (5 ln^{(9t)})i + (7t^{3})j $$

***A25)***

Acceleration Vector:

$$ = \overrightarrow{ r'' } (t) = < x''(t), y''(t), z''(t) > $$

$$ \overrightarrow{ r' } (t) = (\frac{5}{9t})i+(21t^{2})j $$

$$ \overrightarrow{ r'' } (t) = (-\frac{25}{t^{2}})i+(42t)j $$

$$ \therefore \ < -5t^{-2}, \ 42t > $$

---

**The position vector of a particle is r(t). Find the requested vector.**

***Q26)*** The velocity at $$ t = 4 $$ for $$ r(t) = (9t^{2} + 3t + 10)i - 8t^{3}j + (5 - t^{2})k $$

***A26)***

$$ x'(t) = 18t+3 \ \Rightarrow \ x'(4) = 75 $$

$$ y'(t) = -24t^{2} \ \Rightarrow \ y'(4) = -384 $$

$$ z'(t) = -2t \ \Rightarrow \ z'(4) = -8 $$

$$ \therefore \ < 75, \ -384, \ -8 > $$

<br>

***Q27)*** The acceleration at $$ t = 2 $$ for $$ r(t) = (3t - 3t^{4})i + (6 - t)j + (2t^{2} - 5t)k $$

***A27)***

$$ \begin{cases} x'(t) = (3-12t^{3})\\ x''(t)=-36t^{2}\end{cases} $$

$$ \begin{cases} y'(t) = -1\\ y''(t)=0\end{cases}  $$

$$ \begin{cases} z'(t) = 4t-5\\ z''(t)=4\end{cases} $$

$$ \therefore \ < -144, \ 0, \ 4 > $$

---

**Find the unit tangent vector of the given curve.**

***Q28)*** $$ r(t) = 4t^{6}i - 3t^{6}j + 12t^{6}k$$

***A28)***

$$ r'(t) = 24t^{5}i-18t^{5}j+72t^{5}k $$

$$ \mid \overline{r'} (t) \mid = \sqrt{(24t^{5})^{2} + (18t^{5})^{2} + (72t^{5})^{2}} = 78t^{5}$$

$$ \overline{T}(t) = \frac{\overline{r'} (t)}{\mid \overline{r'} (t) \mid} = \frac{1}{78t^{5}}<24t^{5}, -18t^{5}, 72t^{5}>$$

$$ \therefore \ < \frac{12}{39}, \ \frac{-9}{39}, \ \frac{36}{39} > $$

<br>

***Q29)*** $$ r(t) = (4 - 2t)i + (2t - 4)j + (9 + t)k $$

***A29)***

$$ r'(t) = -2i+2j+k $$

$$ \mid \overline{r'} (t) \mid = \sqrt{(-2)^2+(2)^2+(1)^2} = 3 $$

$$ \therefore \ < -\frac{2}{3}, \ \frac{2}{3}, \ \frac{1}{3} > $$

---

**Calculate the arc length of the indicated portion of the curve $$ r(t) $$.**

***Q30)*** $$  r(t) = 10t^{3}i + 11t^{3}j + 2t^{3}k $$, $$ -1 \leq t \leq 2$$

***A30)***

$$ L= \int_a^b \sqrt{x'(t)^{2}+y'(t)^{2}+z'(t)^{2}} dt $$

$$ = \int_a^b  \mid  \overrightarrow{r} ' \mid dt = \int_a^b  \mid  \overrightarrow{v} \mid dt $$

$$ L= \int_{-1}^{2} \sqrt{(30t^{2})^{2}+(33t^{2})^{2}+(6t^{2})^{2}} dt $$

$$ L= \int_{-1}^{2} \sqrt{2025t^{4}}dt = \int_{-1}^{2} 45t^{2}dt $$

$$ (15 \times (2)^{3} ) - (15 \times (-1)^{3} ) $$

$$ \therefore 135 $$

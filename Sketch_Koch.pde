int level = 4; // Nivel de recursión
float angle = radians(60);
float length = 400;
PVector start, end;
void setup() {
size(600, 300);
background(0, 128, 0); // Fondo verde
stroke(255);
noLoop();
start = new PVector(100, height - 100);
end = new PVector(start.x + length, start.y);
frameRate(10); // Velocidad de animación
}
void draw() {
background(0, 128, 0); // Refresca el fondo verde en cada frame
koch(start, end, level);
end.set(start.x + length, start.y); // Reiniciar el punto final
start.x += 10; // Cambia la posición de inicio para la animación
if (start.x > width) {
noLoop(); // Detiene la animación cuando llega al borde derecho
}
}
void koch(PVector a, PVector b, int level) {
if (level == 0) {
line(a.x, a.y, b.x, b.y);
} else {
PVector[] kochLine = kochLine(a, b);
for (int i = 0; i < 5; i++) {
koch(kochLine[i], kochLine[i + 1], level - 1);
}
}
}
PVector[] kochLine(PVector a, PVector b) {
PVector[] lineSegments = new PVector[6];
PVector v = PVector.sub(b, a);
v.div(3);
lineSegments[0] = a.copy();
lineSegments[1] = PVector.add(a, v);
v.rotate(-angle);
lineSegments[2] = PVector.add(lineSegments[1], v);
v.rotate(angle * 2);
lineSegments[3] = PVector.add(lineSegments[2], v);
v.rotate(-angle);
lineSegments[4] = PVector.add(lineSegments[3], v);
lineSegments[5] = b.copy();
return lineSegments;
}

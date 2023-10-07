float length = 200;
void setup() {
size(800, 800);
background(0, 128, 0); // Fondo verde
noLoop();
frameRate(10); // Velocidad de animación
}
void draw() {
background(0, 128, 0); // Refresca el fondo verde en cada frame
translate(width / 2, height / 2);
stroke(255);
recursiveCircles(0, 0, length, 6);
length -= 10; // Disminuir la longitud para la animación
if (length < 10) {
noLoop(); // Detiene la animación cuando la longitud es muy corta
}
}
void recursiveCircles(float x, float y, float r, int depth) {
ellipse(x, y, r * 2, r * 2);
if (depth > 1) {
float newR = r * 0.5;
recursiveCircles(x + r, y, newR, depth - 1);
recursiveCircles(x - r, y, newR, depth - 1);
recursiveCircles(x, y + r, newR, depth - 1);
recursiveCircles(x, y - r, newR, depth - 1);
}
}

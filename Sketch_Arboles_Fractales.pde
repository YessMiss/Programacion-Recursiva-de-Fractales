float startLen = 200;
float minLength = 2;
float angle = radians(30);
void setup() {
size(800, 800);
background(0, 128, 0); // Fondo verde
noLoop();
frameRate(10); // Velocidad de animación
}
void draw() {
background(0, 128, 0); // Refresca el fondo verde en cada frame
translate(width / 2, height);
stroke(255);
branch(startLen);
startLen -= 2; // Disminuir la longitud para la animación
if (startLen < minLength) {
noLoop(); // Detiene la animación cuando la longitud es muy corta
}
}
void branch(float len) {
  line(0, 0, 0, -len);
translate(0, -len);
if (len > minLength) {
pushMatrix();
rotate(angle);
branch(len * 0.7);
popMatrix();
pushMatrix();
rotate(-angle);
branch(len * 0.7);
popMatrix();
}
}

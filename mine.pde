void mine(float mineSize) {
  ellipseMode(CENTER);
  noStroke();

  //自機描画
  fill(111, 186, 0);
  ellipse(mouseX, mouseY, mineSize, mineSize);
}

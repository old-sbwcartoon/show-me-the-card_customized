package com.rnh.showmethecard.ui;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class SpriteImage {

	int row, col, width, height;
	BufferedImage bigImag;
	public SpriteImage(int row, int col, int width, int heigt) {
		this.row = row;
		this.col = col;
		this.width = width;
		this.height = height;
	}
	
	public BufferedImage[] getSpliteImage() {
		try {
			//imageIO 클래스를 이용하여 이미를 불러온다.
			bigImag = ImageIO.read(new File("/showmethecard/resources/assets/images/level.PNG"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		//자른 이미지를 담을 수 있는 배열 생성 [행*열] = 갯수
		BufferedImage splitImages[] = new BufferedImage[row * col];
		for (int i = 0; i < row ; i++) {
			for (int j = 0; j < col; j++) {
				//getSubimage메소드 사용
				//앞 파라미터부터 시작 x,y,가로, 세로
				splitImages[i*col + j] = bigImag.getSubimage(j*width, i*height, width, height);
			}			
		}
		//잘라진 이미지 배열 반환
		return splitImages;
	}

}

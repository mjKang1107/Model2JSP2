import java.util.ArrayList;
import java.util.*;

public class ArrayListTest {
	public static void main(String[] args) {
		// 컬렉션: 자료구조, 제네릭
		
		// int[] arr : 고정길이 배열
		// ArrayList : 가변길이 배열(동적배열)
		// => 데이터의 크기 자동으로 변경 , list 계열 (순서를 기억(index),중복허용) 

		ArrayList arr = new ArrayList();
				//제네릭
		
		//데이터 입력
		//arr[0] = 100; (X)
		
		//Integer -> int
		//Character -> char
		//Boolean -> boolean ...나머지타입 전부 첫글자 대문자로 되어있음
		
		// * 박싱 : 기본형데이터 -> 참조형데이터
		// * 언박싱 : 참조형데이터 -> 기본형데이터
		// => 오토박싱 / 오토언박싱( 1.6~)
		//상속은 참조형만 가능하다.
		
		arr.add(100); // wrapper클래스(8개) : 기본형데이터타입을 참조형 변경해줌 -> integer타입 (박싱->상속가능)
		arr.add("hello"); //Object에 String을 담을수 있어서 가능(업캐스팅 일어남-박싱이 되었기때문(상속가능)) -> 다른타입도 다 가능
		arr.add(3.1313);
		arr.add(true);
		
		System.out.println(arr); // [100, hello, 3.1313, true] 넣은 순서대로 잘 들어가있음(index) 
		
		System.out.println(arr.get(1)); //hello
		
		arr.add(1,500);
		System.out.println(arr); //[100, 500, hello, 3.1313, true] 1번 인덱스 자리에 500 담기
		
		arr.remove(0); //인덱스값 지우기
		System.out.println(arr); // [500, hello, 3.1313, true]
		
		System.out.println(arr.size()); //4 요소의 갯수
		
		
	}

}

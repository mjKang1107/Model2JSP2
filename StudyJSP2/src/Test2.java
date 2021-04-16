class Parent{
	public void pprn(){
		System.out.println("부모-pprn()");
		
	}
	
	
	
}

class Child extends Parent{
	public void cprn(){
		System.out.println("자식-cprn()");
		//부모의 기능 사용 가능 pprn(),cprn()-둘다 사용 가능
	}
	
	
}

public class Test2 {

	public static void main(String[] args) {
		Parent p = new Parent();
		p.pprn();
		//p.cprn(); 부모클래스에는 자식객체거를 쓸수 없어서 에러남
		Child c = new Child();
		c.cprn();
		c.pprn();
		
		//업캐스팅 - 부모타입으로 형변환(자동)
		//부모 레퍼런스에 자식의 인스턴스를 저장
		Parent p1 = new Child();
		p1.pprn();
		//p1.cprn(); 업캐스팅은 상속받은거만 사용할수 있기 때문에 에러남
		
		//다운캐스팅- 자식타입으로 형변환(강제)
		//자식의 레퍼런스에 부모의 인스턴스를 저장
		//컴파일러가 자동으로 형변환을 안해줌 -> 문제가 있음
		//강제형변환 => 컴파일러에게 문제가 있음을 알고 그래도 진행하라고 하는거 
		//Child c1 = (Child) new Parent();
		//c1.pprn();
		//c1.cprn();
		
		//업캐스팅/다운캐스팅 시에는 2번에 단계를 사용해서 에러체크
		//1)컴파일시 - 컴파일 오류 체크
		//2)실행시 - 예외를 체크
		
		Parent p2 = new Child(); //업캐스팅해주고
		
		Child c2 = (Child) p2; //다운캐스팅
		c2.cprn();
		c2.pprn();
		
	}

}

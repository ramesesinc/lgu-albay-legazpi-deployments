package obo.facts;

public class OboBooleanInfo extends OboVariableInfo {

	public boolean getValue() {
		return this.booleanvalue;
	}
	
	public void setValue( boolean d ) {
		this.booleanvalue = d;
	}
	
	public OboBooleanInfo(){;}

	public OboBooleanInfo(def d){
		copy(d);
	}

}



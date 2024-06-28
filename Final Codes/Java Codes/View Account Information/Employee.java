package viewaccountinformation;

final public class Employee {
	private String firstName;
	private String middleName;
	private String lastName;
	private String gender;
	private int age;
	private String role;
	private String phoneNumber;


	public Employee(String firstName, String middleName, String lastName, String gender, int age, String role, String phoneNumber) {
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.gender = gender;
		this.age = age;
		this.role = role;
		this.phoneNumber = phoneNumber;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return String.format(
				"Employee Information:%n" + "First Name: %s%n" + "Middle Name: %s%n" + "Last Name: %s%n"
						+ "Gender: %s%n" + "Age: %d%n" + "Role: %s%n" +  "Phone Number: %s%n",
				firstName, middleName, lastName, gender, age,  role, phoneNumber);
	}
}

package medicalreport;

final public class Medical {
	private String medicalReport;
	private String doctorName;
	
	public Medical(String medicalReport, String doctorName) {
		this.medicalReport = medicalReport;
		this.doctorName = doctorName;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getMedicalReport() {
		return medicalReport;
	}

	public void setMedicalReport(String medicalReport) {
		this.medicalReport = medicalReport;
	}

	@Override
	public String toString() {
		StringBuilder result = new StringBuilder();
		result.append(medicalReport).append(doctorName);

		return result.toString();
	}
}

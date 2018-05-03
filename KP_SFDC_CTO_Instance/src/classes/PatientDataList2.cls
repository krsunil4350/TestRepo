public class PatientDataList2 {

	public class EnvResponse {
		public String environment;
		public Object exceptions;
		public List<RecordD> recordD;
		public String integrationVersion;
		public String commandUpdated;
		public String responseInstance;
		public String routineVersion;
	}

	public class ContactD {
		public List<ResData> resData;
	}

	public List<EnvResponse> envResponse;

	public class ResData {
		public String key;
		public Object networks1;
		public String value;
	}

	public class Networks2 {
		public String key;
		public String value;
	}

	public class Networks1 {
		public String key;
		public Object networks2;
		public String value;
	}

	public class RecordD {
		public List<ContactD> contactD;
		public List<ResData> resData;
	}

	
	public static PatientDataList parse(String json) {
		return (PatientDataList) System.JSON.deserialize(json, PatientDataList.class);
	}
}
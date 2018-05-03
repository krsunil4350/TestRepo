public with sharing class fhirAPI {
    public static String BASE_URL = 'https://open-ic.epic.com/FHIR/api/FHIR/DSTU2/'; 

    //Method to perform a callout and return an httpResponse
	public static httpResponse callout(String httpMethod, String endpoint, String body){
		//Instantiate an httpRequest and set the required attributes
		httpRequest req = new httpRequest();
		req.setMethod(httpMethod);
        req.setEndpoint(endpoint);

        //Optional attributes are often required to conform to the 3rd Party Web Service Requirements
		req.setHeader('Accept-Encoding','gzip, deflate');

		//You can adjust the timeout duration (in milliseconds) to deal with slow servers or large payloads
		req.setTimeout(120000);

		//Use the HTTP Class to send the httpRequest and receive an httpResposne
		/*If you are not using an HttpCalloutMock: 
		if (!test.isRunningTest){
		*/
		httpResponse res = new http().send(req);
		/*If you are not using an HttpCalloutMock: 
		}
		*/
		system.debug(res.toString());
		system.debug(res.getBody());
		return res;
	}

    /********************* Apex Inner Classes to represent FHIR objects ***********************/

    public class Type_Z {
		public String text {get;set;} 

		public Type_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'text') {
							text = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Type_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

    public String resourceType {get;set;} 
	public String type_Z {get;set;} // in json: type
	public Integer total {get;set;} 
	public List<Entry> entry {get;set;} 
	public List<Link> link {get;set;} 

	public fhirAPI(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'resourceType') {
						resourceType = parser.getText();
					} else if (text == 'type') {
						type_Z = parser.getText();
					} else if (text == 'total') {
						total = parser.getIntegerValue();
					} else if (text == 'entry') {
						entry = arrayOfEntry(parser);
					} else if (text == 'link') {
						link = arrayOfLink(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Address {
		public String use {get;set;} 
		public List<String> line {get;set;} 
		public String city {get;set;} 
		public String state {get;set;} 
		public String postalCode {get;set;} 
		public String country {get;set;} 

		public Address(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'use') {
							use = parser.getText();
						} else if (text == 'line') {
							line = arrayOfString(parser);
						} else if (text == 'city') {
							city = parser.getText();
						} else if (text == 'state') {
							state = parser.getText();
						} else if (text == 'postalCode') {
							postalCode = parser.getText();
						} else if (text == 'country') {
							country = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Address consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Resource {
		public String resourceType {get;set;} 
		public String birthDate {get;set;} 
		public Boolean active {get;set;} 
		public Boolean deceasedBoolean {get;set;} 
		public List<CareProvider> careProvider {get;set;} 
		public List<Name> name {get;set;} 
		public List<Identifier> identifier {get;set;} 
		public List<Address> address {get;set;} 
		public List<Telecom> telecom {get;set;} 
		public Type_Z maritalStatus {get;set;} 
		public List<Communication> communication {get;set;} 

		public Resource(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'resourceType') {
							resourceType = parser.getText();
						} else if (text == 'birthDate') {
							birthDate = parser.getText();
						} else if (text == 'active') {
							active = parser.getBooleanValue();
						} else if (text == 'deceasedBoolean') {
							deceasedBoolean = parser.getBooleanValue();
						} else if (text == 'careProvider') {
							careProvider = arrayOfCareProvider(parser);
						} else if (text == 'name') {
							name = arrayOfName(parser);
						} else if (text == 'identifier') {
							identifier = arrayOfIdentifier(parser);
						} else if (text == 'address') {
							address = arrayOfAddress(parser);
						} else if (text == 'telecom') {
							telecom = arrayOfTelecom(parser);
						} else if (text == 'maritalStatus') {
							maritalStatus = new Type_Z(parser);
						} else if (text == 'communication') {
							communication = arrayOfCommunication(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Resource consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Name {
		public String use {get;set;} 
		public List<String> family {get;set;} 
		public List<String> given {get;set;} 

		public Name(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'use') {
							use = parser.getText();
						} else if (text == 'family') {
							family = arrayOfString(parser);
						} else if (text == 'given') {
							given = arrayOfString(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Name consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Search_Z {
		public String mode {get;set;} 

		public Search_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'mode') {
							mode = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Search_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Telecom {
		public String system_Z {get;set;} // in json: system
		public String value {get;set;} 
		public String use {get;set;} 

		public Telecom(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'system') {
							system_Z = parser.getText();
						} else if (text == 'value') {
							value = parser.getText();
						} else if (text == 'use') {
							use = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Telecom consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Entry {
		public String fullUrl {get;set;} 
		public List<Link> link {get;set;} 
		public Search_Z search_Z {get;set;} // in json: search
		public Resource resource {get;set;} 

		public Entry(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'fullUrl') {
							fullUrl = parser.getText();
						} else if (text == 'link') {
							link = arrayOfLink(parser);
						} else if (text == 'search') {
							search_Z = new Search_Z(parser);
						} else if (text == 'resource') {
							resource = new Resource(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Entry consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Identifier {
		public String use {get;set;} 
		public String system_Z {get;set;} // in json: system
		public String value {get;set;} 
		public Type_Z type_Z {get;set;} // in json: type

		public Identifier(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'use') {
							use = parser.getText();
						} else if (text == 'system') {
							system_Z = parser.getText();
						} else if (text == 'value') {
							value = parser.getText();
						} else if (text == 'type') {
							type_Z = new Type_Z(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Identifier consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Language {
		public String text {get;set;} 
		public List<Coding> coding {get;set;} 

		public Language(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'text') {
							text = parser.getText();
						} else if (text == 'coding') {
							coding = arrayOfCoding(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Language consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Coding {
		public String system_Z {get;set;} // in json: system
		public String code {get;set;} 
		public String display {get;set;} 

		public Coding(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'system') {
							system_Z = parser.getText();
						} else if (text == 'code') {
							code = parser.getText();
						} else if (text == 'display') {
							display = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Coding consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class CareProvider {
		public String display {get;set;} 
		public String reference {get;set;} 

		public CareProvider(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'display') {
							display = parser.getText();
						} else if (text == 'reference') {
							reference = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'CareProvider consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Link {
		public String relation {get;set;} 
		public String url {get;set;} 

		public Link(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'relation') {
							relation = parser.getText();
						} else if (text == 'url') {
							url = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Link consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Communication {
		public Boolean preferred {get;set;} 
		public Language language {get;set;} 

		public Communication(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'preferred') {
							preferred = parser.getBooleanValue();
						} else if (text == 'language') {
							language = new Language(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Communication consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
		public static JSON2Apex parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new JSON2Apex(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	
    private static List<Link> arrayOfLink(System.JSONParser p) {
        List<Link> res = new List<Link>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Link(p));
        }
        return res;
    }

    private static List<CareProvider> arrayOfCareProvider(System.JSONParser p) {
        List<CareProvider> res = new List<CareProvider>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new CareProvider(p));
        }
        return res;
    }

    private static List<Entry> arrayOfEntry(System.JSONParser p) {
        List<Entry> res = new List<Entry>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Entry(p));
        }
        return res;
    }

    private static List<Coding> arrayOfCoding(System.JSONParser p) {
        List<Coding> res = new List<Coding>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Coding(p));
        }
        return res;
    }

    private static List<Address> arrayOfAddress(System.JSONParser p) {
        List<Address> res = new List<Address>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Address(p));
        }
        return res;
    }

    private static List<Telecom> arrayOfTelecom(System.JSONParser p) {
        List<Telecom> res = new List<Telecom>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Telecom(p));
        }
        return res;
    }

    private static List<String> arrayOfString(System.JSONParser p) {
        List<String> res = new List<String>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getText());
        }
        return res;
    }

    private static List<Communication> arrayOfCommunication(System.JSONParser p) {
        List<Communication> res = new List<Communication>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Communication(p));
        }
        return res;
    }

    private static List<Identifier> arrayOfIdentifier(System.JSONParser p) {
        List<Identifier> res = new List<Identifier>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Identifier(p));
        }
        return res;
    }

    private static List<Name> arrayOfName(System.JSONParser p) {
        List<Name> res = new List<Name>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Name(p));
        }
        return res;
    }

}
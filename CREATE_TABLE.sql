CREATE TABLE area
(
  areaId NUMERIC(3),
  areaName VARCHAR(20),
  PRIMARY KEY (areaId)
);

CREATE TABLE city
(
  CityName VARCHAR(20),
  areaId NUMERIC(3),
  PRIMARY KEY (CityName),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);

CREATE TABLE agent
(
  agentID NUMERIC(9),
  Rating NUMERIC(2),
  HireYear NUMERIC(4),
  AgentName VARCHAR(20),
  BossID NUMERIC(9),
  Salary FLOAT,
  areaId NUMERIC(3),
  PRIMARY KEY (agentID),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);




CREATE TABLE client
(
  clientID NUMERIC(9),
  clientName VARCHAR(20),
  phoneNr VARCHAR(10),
  Address VARCHAR(25),
  agentID NUMERIC(9),
  CityName VARCHAR(20),
  PRIMARY KEY (clientID),
  FOREIGN KEY (agentID) REFERENCES agent(agentID),
  FOREIGN KEY (CityName) REFERENCES city(CityName)
);

CREATE TABLE schedule
(
  meetingTime DATE,
  clientID NUMERIC(9),
  agentID NUMERIC(9),
  PRIMARY KEY (meetingTime, clientID, agentID),
  FOREIGN KEY (clientID) REFERENCES client(clientID),
  FOREIGN KEY (agentID) REFERENCES agent(agentID)
);

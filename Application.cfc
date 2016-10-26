﻿component{
	this.name='learncfinaweek';
	this.datasource='learncfinaweek';
	this.applicationTimeout=CreateTimeSpan(10, 0, 0, 0);
	this.sessionManagement=true;
	this.sessionTimeout=CreateTimeSpan(0, 0, 30, 0);
	this.ormEnabled=true;
	this.ormSettings={
		logsql=true,
		dbcreate="update",
		cfclocation="com/entity"
		};
	this.invokeImplicitAccessor=true;
	this.sessionCookie.httpOnly=true;
	this.sessionCookie.timeout='10';
	this.sessionCookie.disableupdate=true;

	function onApplicationStart(){
		application.myPosition='A Software Engineer';
		application.utilities = CreateObject('cfc.utilities');
		return true;
	}

	function onRequestStart(string targetPage){
		if(structKeyExists(url, 'reload')){
			onApplicationStart();
			ormReload();
		}
	}

	function onError( any Exception, string EventName){
			var msq = arguments.exception.message;
		var msq1 = arguments.exception.detail;
		var msq2 = arguments.exception.type;
		include 'sorry.cfm';
		var errorEmail = new mail();
		errorEmail.setTo('jasonssuttles@gmail.com');
		errorEmail.setFrom('raptor992@gmail.com');
		errorEmail.setSubject('An Error has Occured');
		errorEmail.setBody('
			Message: #arguments.exception.message# <br />
			Details: #arguments.exception.detail# <br />
			Type: #arguments.exception.type# <br />
		');
		errorEmail.setType('html');
		errorEmail.send();
	}
}

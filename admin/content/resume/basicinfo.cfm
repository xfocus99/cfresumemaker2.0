<cfimport taglib="../../customTags" prefix="ct" />
<ct:securityCheck redirectPage="#cgi.script_name#"/>

<cfparam name="url.id" default="0" />
<cfparam name="form.submitted" default="0" />
<cfparam name="form.id" default="0" />
<cfparam name="form.fulLname" default="Allan Kollman" />
<cfparam name="form.email" default="allankollman@my.smccd.edu" />
<cfparam name="form.phone" default="7573374841" />
<cfparam name="form.linkedin" default="linkedin.com/in/xfocus" />
<cfparam name="form.twitter" default="@xfocus" />
<cfparam name="form.skype" default="xfocus" />
<cfparam name="form.website" default="www.example.com" />
<cfparam name="form.aboutme" default="www.example.com" />


<cfset errorBean = createObject('cfResumemaker.admin.cfc.errorBean').init() />

<cfif form.submitted>

	<!--- check if data is valid--->
		
	<cfif !len(trim(form.fulLname))>
		<cfset errorBean.addError('name is required','fulLname') />
	</cfif>	
	
	<cfif !len(trim(form.email))>
		<cfset errorBean.addError('email is required','email') />
	</cfif>	
		
	<cfif !errorBean.hasErrors()>
<cfoutput>
		'#form.id#'
</cfoutput>

		<cfif val(form.id)>
			<cfquery>
				UPDATE
					basicinfo
				SET
					id = <cfqueryparam value="#trim(form.id)#" cfsqltype="cf_sql_integer" />,
					fullname = <cfqueryparam value="#trim(form.fullname)#" cfsqltype="cf_sql_varchar" />,
					email = <cfqueryparam value="#trim(form.email)#" cfsqltype="cf_sql_varchar" />,
					linkedin = <cfqueryparam value="#trim(form.linkedin)#" cfsqltype="cf_sql_varchar" />,
					skype = <cfqueryparam value="#trim(form.skype)#" cfsqltype="cf_sql_varchar" />,
					phone = <cfqueryparam value="#trim(form.phone)#" cfsqltype="cf_sql_varchar" />,
					twitter = <cfqueryparam value="#trim(form.twitter)#" cfsqltype="cf_sql_varchar" />,
					website = <cfqueryparam value="#trim(form.website)#" cfsqltype="cf_sql_varchar" />,		
					aboutme = <cfqueryparam value="#trim(form.aboutme)#" cfsqltype="cf_sql_varchar" />

			
				WHERE
					id = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer" />	
			</cfquery>
		<cfelse>
			<cfquery>
				INSERT INTO
					basicinfo (
						id,
					fullname,
					email,
					linkedin,
					skype,
					phone,
					twitter,
					website,
					aboutme
				) VALUES (
					<cfqueryparam value=1 cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#trim(form.fullname)#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#trim(form.email)#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#trim(form.linkedin)#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#trim(form.skype)#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#trim(form.phone)#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#trim(form.twitter)#" cfsqltype="cf_sql_varchar" />,					
					<cfqueryparam value="#trim(form.website)#" cfsqltype="cf_sql_varchar" />,
	    			<cfqueryparam value="#trim(form.aboutme)#" cfsqltype="cf_sql_varchar" />


				)
			</cfquery>
		</cfif>
		
		<cflocation url="basicinfo.cfm?id=1&message=#urlencodedformat('Info Saved')#" addtoken="false" />
	</cfif>	
</cfif>

<cfif val(url.id)>
	<cfquery name="qBasicinfo">
		SELECT
			id,
			fullname,
			email,
			linkedin,
			skype,
			phone,
			twitter,
			website,
			aboutme
		FROM
			basicinfo
		WHERE
			id=<cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer" />	
	</cfquery>
	<cfif val(qBasicinfo.id)>
	<cfset form.id = qBasicinfo.id />
	<cfset form.fullname = qBasicinfo.fullname />
	<cfset form.email = qBasicinfo.email />
	<cfset form.linkedin = qBasicinfo.linkedin />
	<cfset form.skype = qBasicinfo.skype />
	<cfset form.phone = qBasicinfo.phone />
	<cfset form.twitter = qBasicinfo.twitter />
	<cfset form.website = qBasicinfo.website />
	<cfset form.aboutme = qBasicinfo.aboutme />

	<cfoutput>
</cfoutput>

	<cfelse>
	<cfset form.id = '' />
	</cfif>
</cfif>

<ct:layout section="resume">
	<ct:navigation section="resume" active="basicinfo"/>
	
	<div class="span10">
		<i class="fa fa-user fa-3x" aria-hidden="true"></i>
		<h2>Basic Info</h2>
<cfoutput>
		
		
			<cfif errorBean.hasErrors()>
			    <div class="alert alert-error">
			    	<strong>Error</strong><br />
					The following errors occured:
					<ul>
						<cfloop array="#errorBean.getErrors()#" index="error">
							<li>#error.message#</li>
						</cfloop>
					</ul>
			    </div>
			</cfif>
			
			<form class="form-horizontal" action="#cgi.script_name#" method="post">
				<label>Can I get your name?</label>
					<input type="text" id="fullname" name="fullname" value="#form.fullname#">

					<label>Please don't use your 6th grade email address.</label>
					<input type="text" id="email" name="email" value="#form.email#">

					<label>What's your phone number?</label>
					<input type="text" id="phone" name="phone" value="#form.phone#">

					<label>Do you have a LinkedIn?</label>
					<input type="text" id="linkedin" name="linkedin" value="#form.linkedin#">

					<label>Do you have a twitter?</label>
					<input type="text" id="twitter" name="twitter" value="#form.twitter#">

					<label>Do you have a skype?</label>
					<input type="text" id="skype" name="skype" value="#form.skype#">

					<label>Do you have a personal website ?</label>
					<input type="text" id="website" name="website" value="#form.website#">
					<label>Tell Us About You!</label>
					<textarea id="aboutme" name="aboutme" value="#form.aboutme#">#form.aboutme#</textarea>
					<p></p>
					<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</div>
				<input type="hidden" name="submitted" value="1" />
				<input type="hidden" name="id" value="#form.id#" />
			</form>
		
</cfoutput>


	</div>	
</ct:layout>	

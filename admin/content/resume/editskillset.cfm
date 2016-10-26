<cfimport taglib="../../customTags" prefix="ct" />
<ct:securityCheck redirectPage="#cgi.script_name#"/>

<cfparam name="url.id" default="0" />
<cfparam name="form.submitted" default="0" />
<cfparam name="form.id" default="0" />
<cfparam name="form.name" default="" />
<cfparam name="form.percentage" default="1" />
<cfparam name="form.color" default="##78A72C" />

<cfset errorBean = createObject('cfResumemaker.admin.cfc.errorBean').init() />

<cfif form.submitted>

	<!--- check if data is valid--->
		
	<cfif !len(trim(form.name))>
		<cfset errorBean.addError('Name is required','title') />
	</cfif>	
	
	
	<cfif !errorBean.hasErrors()>
		<cfif val(form.id)>
			<cfquery>
				
				UPDATE
					skillset
				SET
					name = <cfqueryparam value="#trim(form.name)#" cfsqltype="cf_sql_varchar" />,
					percentage = <cfqueryparam value="#trim(form.percentage)#" cfsqltype="cf_sql_integer" />,
					color = <cfqueryparam value="#trim(form.color)#" cfsqltype="cf_sql_varchar" />
				WHERE
					id = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer" />	
			</cfquery>
		<cfelse>
			<cfquery>
				INSERT INTO
					skillset (
					name,
					percentage,
					color
				) VALUES (
					<cfqueryparam value="#trim(form.name)#" cfsqltype="cf_sql_varchar" />,
				    <cfqueryparam value="#trim(form.percentage)#" cfsqltype="cf_sql_integer" />,	
   					<cfqueryparam value="#trim(form.color)#" cfsqltype="cf_sql_varchar" />
				)
			</cfquery>
		</cfif>
				<cflocation url="listskillset.cfm?message=#urlencodedformat('Education Saved')#" addtoken="false" />

	</cfif>	
</cfif>

<cfif val(url.id)>
	<cfquery name="qSkillset">
		SELECT
			id,
			name,
			percentage,
			color
		FROM
			skillset
		WHERE
			id=<cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer" />	
	</cfquery>
	
	<cfset form.id = qSkillset.id />
	<cfset form.name = qSkillset.name />
	<cfset form.percentage = qSkillset.percentage />
	
	<cfset form.color = qSkillset.color />

</cfif>

<cfoutput>
	<ct:layout section="resume">
		<ct:navigation section="resume" active="skillset"/>
		
		<div class="span10">
			<cfif val(url.id)>
				<h2>Edit Skillset</h2>
			<cfelse>
				<h2>Add Skillset</h2>
			</cfif>
			
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
				<div class="control-group">
					<label class="control-label" for="title">Name</label>
					<div class="controls">
						<input type="text" id="name" name="name" value="#form.name#">
						
						
					</div>
				
                                                                
				</div>
				
				<div class="control-group">
					<label class="control-label" for="title">Percentage</label>
					<div class="controls">
					<div id="progress" name="progress">#form.percentage#</div>
											<input type="hidden" id="percentage" name="percentage" value="#form.percentage#">

					<div class="application-progress"></div>				
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="title">Color</label>
					<div class="controls">
						<div>
						<input type="text" maxlength="6" size="6" id="color" name="color" value="#form.color#"></div>
						
					</div>
				
                                                                
				</div>	
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</div>
				<input type="hidden" name="submitted" value="1" />
				<input type="hidden" name="id" value="#url.id#" />
			</form>
		</div>	
	</ct:layout>	
</cfoutput>

<script >
	window.onload = function() {
$('.application-progress').slider({
    range: "min",
    value:$("#progress").text(),
    min: 0,
    max: 100,
    slide: function(event, ui) {
        $("#progress").text(ui.value);
        $("#percentage").attr('value',ui.value);
    }
});
$("#progress").html($(".application-progress").slider("value") + "%");

$('#color').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val("#"+hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});

}
</script>	

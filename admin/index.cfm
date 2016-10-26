<cfquery name="qSkillsets">
	SELECT
		id,
		name,
		percentage,
		color
	FROM
		skillset
	ORDER BY
		name
</cfquery>
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
			id=<cfqueryparam value=1 cfsqltype="cf_sql_integer" />	
	</cfquery>
	
<cfquery name="qEducation">
	SELECT
		id,
		title,
		startDate,
		endDate
	FROM
		resume
	WHERE
		type = 'Education'
</cfquery>
	<cfquery name="qWorkExperience">
	SELECT
		id,
		title,
		startDate,
		endDate
	FROM
		resume
	WHERE
		type = 'Work Experience'
</cfquery>
<cfquery name="qPortfolio">
	SELECT
		id,
		title,
		website,
		summary
	FROM
		portfolio
	ORDER BY
		title
</cfquery>
<cfimport taglib="customTags" prefix="ct" />
<ct:securityCheck redirectPage="#cgi.script_name#"/>

<ct:layout section="home">
	<div id="smallpdfwrap">
			<!-- Actual PDF -->
			<div id="print_page" class="default_lato">

				<div id="settings_instructions">
					You're almost done!
					<br/><br/>
					adjust the settings below<br/>and click the cloud when you're ready to save your resume.
					<div id="finish_button_wrapper">	
						<!-- <div id="edit_resume">
							<i class="ion-gear-a"></i>
						</div> -->
						<div id="save_resume" onclick="javascript:printPage();">
							<i class="fa fa-download" aria-hidden="true"></i>

						</div>		
					</div>		

					<select class="selectbox" id="selectfont" onchange="getFont(this);">
						<option>Change Font</option>
						<option value="'Lato', sans-serif;">Lato</option>
						<option value="'Roboto', sans-serif">Roboto</option>
						<option value="'Oswald', sans-serif">Oswald</option>
						<option value="'Montserrat', sans-serif">Montserrat</option>
						<option value="'Merriweather', sans-serif">Merriweather</option>
						<option value="'Comfortaa', sans-serif">Comfortaa</option>
						<option value="'Poiret One', sans-serif">Poiret One</option>
					</select>

					<select class="selectbox" id="selectfont" onchange="getAlignment(this);">
						<option>Text Alignment</option>
						<option value="left">Left</option>
						<option value="center">Center</option>
						<option value="right">Right</option>
					</select>

					<select class="selectbox" id="selectspacing" onchange="getSpacing(this);">
						<option>Line Spacing</option>
						<option value="1em">1</option>
						<option value="1.15em">1.15</option>
						<option value="1.25em">1.25</option>
						<option value="1.35em">1.35</option>
						<option value="1.5em">1.5</option>
						<option value="1.75em">1.75</option>
						<option value="2em">2</option>
						<option value="2.25em">2.25</option>
						<option value="2.5em">2.5</option>
						<option value="2.75em">2.75</option>
					</select>
					<br/>
					<select class="selectbox" id="showhr" onchange="getHR(this);">
						<option value="yes">Show Spacer Lines</option>
						<option value="no">Hide Spacer Lines</option>
					</select>



				</div>

				<div id="measure"></div>
				<cfoutput>
				<div id="namefill">#qBasicinfo.fullname#</div>

				<!-- Contact Info -->
					

				<div id="pdf_contact">
					<span id="emailwrap"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span id="emailfill">#qBasicinfo.email#</span></span>
					<span id="phonewrap"><i class="fa fa-phone" aria-hidden="true"></i> <span id="phonefill">#qBasicinfo.phone#</span></span>
					<span id="locationwrap"><i class="fa fa-skype" aria-hidden="true"></i> <span id="skypefill">#qBasicinfo.skype#</span></span>

					<span id="linkfill"></span>
				</div>

				<hr class="hor" />

				<!-- Statement -->
				<div id="pdf_statement_section">
					<p id="statementfill" class="increaseLH">#qBasicinfo.aboutme#</p>
					<hr class="hor" />
				</div>

				<!-- Experience Section -->
				<div id="pdf_experience_section">
					<h2>Experience</h2>
					<!-- Job One -->
					<div id="pdf_job1" class="pdf_job_section">
								<cfoutput>
									<cfloop query="qWorkExperience">
										<div class="arc">
											<span class="increaseLH">#qWorkExperience.title# #dateformat(qWorkExperience.startDate,'mm/dd/yyyy')# to <cfif qWorkExperience.endDate eq "">present<cfelse>#dateformat(qWorkExperience.endDate,'mm/dd/yyyy')#</cfif></span>
						</div>
						</cfloop>
						</cfoutput>

					</div>
					<hr class="hor" />
				</div>


				<!-- Projects Section -->
				<div id="pdf_projects_section">
					<h2 id="projsectiontitlefill">Projects</h2>
					<!-- Job One -->
					<div id="pdf_proj_1" class="pdf_job_section">
						<span id="proj1titlefill"></span>
						<p id="proj1descfill" class="increaseLH"></p>
							<cfoutput>
									<cfloop query="qPortfolio">
										<div class="arc">
											<p class="increaseLH">#qPortfolio.title# </p>
											<span class="increaseLH">#qPortfolio.website#</span>
											<p class="increaseLH">#qPortfolio.summary#</p>

											
						</div>
						</cfloop>
						</cfoutput>
					
					<hr class="hor" />
				</div>



				<!-- Education Section -->
				<div id="pdf_education_section">
					<h2>Education</h2>
					<cfoutput>
									<cfloop query="qEducation">
										<div class="arc">
											<span class="increaseLH">#qEducation.title# #dateformat(qEducation.startDate,'mm/dd/yyyy')# to <cfif qEducation.endDate eq "">present<cfelse>#dateformat(qEducation.endDate,'mm/dd/yyyy')#</cfif></span>
						</div>
						</cfloop>
						</cfoutput>
					
					<hr class="hor" />
				</div>

				<!-- Skills section -->
				<div id="pdf_skills_section">
					<h2>Skills</h2>
						<!-- Skills Listing -->
						<div class="skills">
							<ul>
								<cfoutput>
									<cfloop query="qSkillsets">
										<div class="skillbar clearfix " data-percent="#qSkillsets.percentage#%">
										<div class="skillbar-title" ><span>#qSkillsets.name#</span></div>

										<div class="skillbar-bar" style='background:#qSkillsets.color#'></div>
										<div class="skill-bar-percent">#qSkillsets.percentage#%</div>
</div>
									</cfloop>
										</cfoutput>
								</cfoutput>
							</ul>
						
			</div>
		</div>
		
</ct:layout>	

<script type="text/javascript">
window.onload = function() {
jQuery('.skillbar').each(function(){ 
	var percent = jQuery(this).attr('data-percent')  
	jQuery(this).find('.skillbar-bar'). width(percent)
	
});
}
// Printing Function;
function printPage(){
    window.print();
}
// Change settings
function getFont(fam) {
    $("#print_page").removeClass("default_lato");
    $("#print_page").css("font-family", fam.value);
}
function getAlignment(where) {
   $("#print_page").css("text-align", where.value);
   $("#namefill").css("text-align", where.value);
}
function getSpacing(height) {
   $(".increaseLH").css("line-height", height.value);
   alert(height.value);
}
function getHR(answer) {
   if(answer.value == "no"){
        $(".hor").css({'opacity':0});
   }else if(answer.value == "yes"){
        $(".hor").css({'opacity':1});
   }
}

</script>

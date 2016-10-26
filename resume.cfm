<cfquery name="mySkillSet">
	SELECT
		name,
		percentage,
		color
	FROM
		skillset
	ORDER BY
		name DESC
</cfquery>
<cfquery name="myResume">
	SELECT
		title,
		startDate,
		endDate,
		details,
		type
	FROM
		resume
	ORDER BY
		type,
		endDate,
		startDate
</cfquery>
<cfimport taglib="customTags/" prefix="layout" />
<layout:page section="resume">
<!-- Content Start -->

<!--Card  -->
<div id="content">
	<div class="card-pattern">
	<!-- resume -->
		<div id="resume">
			<div class="clr">
				<div class="top-bg1">
					<div class="top-left">
						<div><h1>Resume</h1></div>
					</div>
				</div>
				<div class="clr">
					<div class="pat-bottomleft">&nbsp;</div>
					<div class="pat-bottomright">&nbsp;</div>
				</div>
			</div>
			<div class="clr">
				<h6>
					<span>Experienced developer with over 10 years track record.</span> <br />
					Professional web development and specializes in developing clean, effective and smart websites.
				</h6>
			</div>
			<div class="clr hline">&nbsp;</div>
			<div class="resume-top">
				<div class="clr">
					<div class="left">
						<!-- Resume Listings -->
						<cfoutput query="myResume" group="type">
							<!-- Resume Listing Type -->
							<h2>#myResume.type# <span>&nbsp;</span></h2>
							<cfoutput>
								<!-- Start Resume Listing -->
								<h5>#myResume.title# <span>#dateFormat(myResume.startDate,"mm/dd/yyyy")# to <cfif len(myResume.endDate)>#dateFormat(myResume.endDate,"mm/dd/yyyy")#<cfelse>present</cfif> </span> </h5>
								<p>#myResume.details#</p>
								<!-- End Resume Listing -->
							</cfoutput>
						</cfoutput>
					</div>
					<div class="right" >
						<h2>My Skillset</h2>
						<!-- Skillset Graphic -->
						<div id="diagram" align="center">
							<div class="get">
								<cfoutput>
									<cfloop query="mySkillset">
										<div class="arc">
											<span class="text">#mySkillset.name#</span>
											<input name="hidden" type="hidden" class="percent" value="#mySkillset.percentage#" />
											<input name="hidden" type="hidden" class="color" value="#mySkillset.color#" />
										</div>
									</cfloop>
								</cfoutput>
							</div>
						</div>
						<!-- Skills Listing -->
						<div class="skills">
							<ul>
								<cfoutput>
									<cfloop query="mySkillset">
										<li class="#mySkillset.name#" is="#mySkillset.name#" style='background:#mySkillset.color#'>#mySkillset.name#</li>
									</cfloop>
								</cfoutput>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="clr"></div>
		</div> <!--resume end -->
</layout:page>

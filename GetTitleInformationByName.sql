USE Titles
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sofia Shrestha
-- Create date: 07/30/2021
-- Description:	Gets all title information by Name
-- =============================================

--EXEC GetTitleInformationByName 'cavalcade'
ALTER PROCEDURE GetTitleInformationByName
	(
	 @TitleName VARCHAR(100)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Select a.AwardYear, a.AwardCompany,COUNT(a.Award) [NumberOfAward], t.TitleId
	INTO #tempAwards
	FROM Award a
	INNER JOIN Title t ON t.TitleId = a.TitleId
	WHERE t.TitleName LIKE '%'+ @TitleName + '%' AND a.AwardWon = 1
	GROUP BY a.AwardCompany, a.AwardYear, t.TitleId
	

	SELECT t.TitleId,  
	Actors=STUFF  
	(  
		 (  
		   SELECT DISTINCT ', ' + p.Name
		   FROM Participant p , TitleParticipant tp 		   
		   WHERE p.Id = tp.ParticipantId and tp.TitleId = t.TitleId and tp.IsKey = 1
		   FOR XML PATH('')  
		 ),1,1,''  
	)  
	INTO #tempActors
	FROM Title t  
	WHERE t.TitleName LIKE '%'+ @TitleName + '%' 
	GROUP BY t.TitleId 
	
	SELECT t.TitleId,  
	Genres =STUFF  
	(  
		 (  
		   SELECT DISTINCT ', ' + g.Name
		   FROM Genre g, TitleGenre tg
		   WHERE g.Id = tg.GenreId and tg.TitleId = t.TitleId
		   FOR XML PATH('')  
		 ),1,1,''  
	)  
	INTO #tempGenres
	FROM Title t  
	WHERE t.TitleName LIKE '%'+ @TitleName + '%' 
	GROUP BY t.TitleId 


	SELECT t.TitleId,  
	Types =STUFF  
	(  
		 (  
		   SELECT DISTINCT ', ' + s.Type
		   FROM StoryLine s
		   WHERE s.TitleId = t.TitleId
		   FOR XML PATH('')  
		 ),1,1,''  
	)  
	INTO #tempTypes
	FROM Title t  
	WHERE t.TitleName LIKE '%'+ @TitleName + '%' 
	GROUP BY t.TitleId 


	SELECT t.TitleId,  
	StoryLines =STUFF  
	(  
		 (  
		   SELECT DISTINCT ', ' + CONVERT(VARCHAR(1000),s.Description)
		   FROM StoryLine s
		   WHERE s.TitleId = t.TitleId
		   FOR XML PATH('')  
		 ),1,1,''  
	)  
	INTO #tempStoryLine
	FROM Title t  
	WHERE t.TitleName LIKE '%'+ @TitleName + '%' 
	GROUP BY t.TitleId 

    -- Insert statements for procedure here
	SELECT DISTINCT Top 10 t.TitleId, t.TitleName, t.ReleaseYear,  ts.StoryLines [StoryDescription],s.Language, tt.Types,tg.Genres [GenreName], ta.Actors--p.RoleType, p.Name [ParticipantName]
	,a.NumberOfAward, a.AwardYear, a.AwardCompany 
	FROM dbo.Title t
	LEFT JOIN StoryLine s ON s.TitleId = t.TitleId
	LEFT JOIN #tempStoryLine ts ON ts.TitleId = t.TitleId
	LEFT JOIN #tempTypes tt ON tt.TitleId = t.TitleId
	LEFT JOIN #tempGenres tg ON tg.TitleId = t.TitleId	
	LEFT JOIN #tempActors ta ON ta.TitleId = t.TitleId	
	LEFT JOIN #tempAwards a ON a.TitleId = t.TitleId 
	WHERE t.TitleName LIKE '%'+ @TitleName + '%'


	  -- how come one movie has so many genre and storyline description? also type like baseline, imdb, Turner External etc
	  --TitleGenre, StoryLine,

END
GO

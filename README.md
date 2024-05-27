# INFO 201 "Foundational Skills for Data Science"
##Spotify Music - Final Deliverable

### Authors

Isha Bhansali, Rajvansh Singh Dang, Ray Vardaro

### Date

Spring 2024

### Keywords

Spotify Music, Song Danceability, Song Energy

### Abstract

Our main question is - Do musical characteristics such as danceability, energy levels, and valence scores correlate to a song's popularity? This question is important because understanding the relationship between various musical aspects and track popularity might provide useful insights into listener tastes and behaviour. To address the question, we will analyze a dataset comprising information on the musical features and popularity ratings of numerous songs. We are concerned with identifying if certain musical genres yield more popular songs since it can shed light on the relationships between music genres and audience preferences, potentially altering business practices and artist strategies. To address this concern, we plan to conduct statistical analyses comparing the popularity of songs in various genres. Consider how certain musicians constantly receive greater popularity scores. This is important because it implies the presence of trends or patterns in the music industry that may inform commercial strategy or artistic decisions. Accordingly, we plan to investigate the features and attributes shared by artists with high popularity scores to better understand their impact on audience reaction.

###Dataset Link
https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset 

For the Final Project -- Data Wrangling, add the following to this code repository: 

* An R script file containing the code you used to create your unified dataset 
* Your unified and cleaned CSV dataset file
* Data Nutrition Label (pdf) 


**Link: Link to your Shiny App here**

Please create the necessary files for your multi-page Shiny app in this GitHub repository. Consult the Canvas assignment for more details. Be sure to publish your app on Shinyapps.io.

When you are finished, please add the text from your introductory and concluding pages below. You might want to use this GitHub repository as part of your digital portfolio, so you want this README.md to offer a brief description of the project and key takeaways.

Feel free to delete these instructions for your final README.md file and to make your GitHub repository public if you would like others to be able to see it. 

# Introduction

Our exploratory project is based on the Spotify Tracks Dataset by the user maharshipandya. In this dataset, over 114,000 songs were collected and filtered by unique factors such as song name, artist name, popularity, song danceability and energy levels. With these various factors, our group is able to establish questions that have correlating trends from the collected data.

•	Do musical characteristics such as danceability and song energy levels correlate to popularity?
•	Do high valence scores relate to a song’s popularity?
•	Do certain musical genres produce more popular songs? 
•	Which artists have the highest popularity scores and is there a common trend?

Our group is interested in finding the correlation between artists, genres, popularity, and musical characteristics. Through this data, we can find information like what effect factors such as danceability, valence, and energy have on their listeners. We can also easily track how both artists and genres can relate to song popularity. Why is this research important to explore?  Our group believes music is a form of art that can affect its listeners, which is important to explore. By determining how certain musical characteristics relate to popularity, we can understand what specific elements of music people enjoy. This data can also explore how music from both popular and unpopular artists can affect their audiences. 

### Related Work  

For our group project, we aim to find the connections within music by exploring the artists, genres, popularity, while comparing them to song danceability, valence and energy levels. While many know that Spotify uses algorithms to align listeners to artists and songs, these systems are based on the listeners’ libraries. In the CNBC article “How Spotify AI plans to know before you do what your brain wants to listen to”, Spotify states investing in machine learning to better fit audiences to their preferred music choices (Jockims. How Spotify AI plans to know before you do what your brain wants to listen to. April 14 2024.) In the Pfizer study “Why — and How — Music Moves Us”, music is described to improve both mood and memory, which is tied heavily to the listeners’ emotional attachment (Fink, Jennifer. Why — and How — Music Moves Us. 2024.). In the Medium article, “Listening to This Music Makes you Happy!”, the relation of high valence, danceability, and energy scores to happiness over multiple generations (Twaddle, Alan. Listening to this music will make you happy!. 20, Aug 2021.). This article also outlines that valence driven happiness can derive from danceability, energy, speechlessness, and even specific key usage. 

### The Dataset

#Where did you find the data? 

I found data through the Google Datasets search. The website name is huggingface.co. Here is the link -> https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset

#Who collected the data? 

Spotify (maharshipandya/spotify-tracks-dataset)

#How was the data collected or generated?  

The data was collected and cleaned using Spotify's Web API and Python (mentioned on the website)

#Why was the data collected?  

Mentioned on the website: 
1. Building a Recommendation System based on some user input or preference
2. Classification purposes based on audio features and available genres

#How many observations (rows) are in your data?  

114,000 rows in total.

#How many features (columns) are in the data?

20 columns 

#What, if any, ethical questions or questions of power do you need to consider when working with this data?  

1. Privacy concerns 
2. Bias in Popularity Metrics
3. Representation and Diversity
4. Impact on the Music Industry

#What are possible limitations or problems with this data?

This dataset may contain several restrictions or concerns. The sampling bias comes first. In statistics, sample bias can occur, resulting in specific song genres or artists being overrepresented or underrepresented. This results in skewed or discrepant research findings. Furthermore, because this information is from a certain period, there may be instances where new songs have been published and are the most popular. This may result in bias. 
Another example is that everyone classifies songs differently based on genre. As a result, errors or inconsistencies may arise along with disparities between the research findings and the dataset. This also explains how we may have little context to improve our comprehension of the dataset and complete our research. We will have to either ignore it or find a way to resolve it. 
Because the dataset only captures music over time, old tracks may become popular or new tracks may become renowned, resulting in excessive variation in the music industry. This, too, cannot be included in the dataset. It would be preferable to use longitudinal data or to update the dataset based on recent information. In addition, as time passes, music evolves in terms of background music, and people experiment with different styles. As a result, one issue is that the dataset does not accurately reflect contemporary music business tastes. 
The last point is based on all of the reasons mentioned above, as well as the fact that the songs used in the dataset are only from the United States and do not contain global variety, as Spanish and Hindi music have recently gained popularity, resulting in dataset generalization. 

4. Implications

### Implications

#Assuming you answer your research questions, briefly describe the expected or possible implications for technologists, designers, and policymakers.

The possible implications for technologists, designers and policymakers are:
1.	Technologists – The findings from the study can be used to improve algorithm recommendations. It also gives us additional information that we may use to improve the algorithm's efficiency. Understanding the links between music selections and their popularity, genre, instruments played, and other factors can also assist the algorithm improve music discovery and recommend new options. 
2.	Designers - They might include the research findings into the user app interface. For example, put popular tracks first or include them in recommended albums. They can utilize this function to promote niche genres or styles that are underrepresented in mainstream media. 
3.	Policymakers – They can utilize this information to understand the music industry better. This could lead to stronger business regulation and efforts to support artists through licensing and copyright. They might also implement more data-driven strategies to support budding musicians by analyzing how people react to certain tracks.

### Limitations & Challenges
#What challenges or limitations might you need to address with your project idea more broadly?

There may be some challenges and limits with the dataset. One of them is the accuracy of the data extracted from the dataset. Any minute mistakes or omissions in recording the song's timing, or a lack of information on when it was released. Another worry is the ethical considerations around the data. We don't know if the information was given with consent or if there were any privacy or representation issues. 
Another problem is that this dataset is based on a specific timeframe, and we must match the dataset's insight to the study questions based on that timeframe. We can't apply the same findings to current music trends because they're so dynamic. The music industry undergoes numerous changes that are difficult to predict using the data we have. We'll need more recent data to do this. We also don't know how the dataset rubrics were calculated. 
For example, the popularity of songs we know is graded from 0 to 100, but we don't know how the figures were computed. These are some challenges and limitations we will have to address with our project. 



# Conclusion / Summary Takeaways


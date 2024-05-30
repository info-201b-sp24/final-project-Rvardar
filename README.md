# INFO 201 "Foundational Skills for Data Science"
##Spotify Music - Final Deliverable

### Authors

Isha Bhansali, Rajvansh Singh Dang, Ray Vardaro

### Date

Spring 2024

### Keywords

Spotify Music, Song Danceability, Song Energy

###Dataset Link

https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset


**Link: Link to your Shiny App here**

https://info201-final-rvardar.shinyapps.io/final-project-Rvardar/


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

Our group found the Spotify data through the Google Datasets search, which can be found here: https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset .

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

Our exploration into the Spotify music dataset yielded several key takeaways that inform our understanding of the connections between musical characteristics and song popularity.

1. Danceability and Energy Correlation with Popularity: 

Analyzing the distribution of danceability and energy levels revealed a positive correlation with song popularity. Songs with higher danceability and energy scores, on average, tend to be more popular as measured by Spotify. This aligns with our initial hypothesis and is supported by the visualization where the cluster of data points appears in the high danceability and high energy region. This finding suggests that listeners gravitate towards music that is upbeat and energetic, potentially due to the association with positive emotions and the desire to move or dance.We see that as we increase the dancebility and energy range the scatterplot appears to form a positive graph whereas when we decrease the maximum points 0.9985 and 1 respectively further making us understand the positive correlation. 

2. Genre Plays a Role in Popularity: 

By comparing average and total popularity across various genres, we observed that specific genres consistently rank higher. The second graph demonstrates this insight, where Pop leads with an average popularity of 47.5 with a total of 47576. Dance follows with an average popularity of 22.69 wiht a total of 22690 which is also appear at the top. This indicates that genre preferences play a significant role in how songs are perceived and consumed. It's important to acknowledge that popularity can be genre-specific, meaning a song might be highly popular within a particular genre but not necessarily achieve mainstream recognition.

3. Audio Feature Distribution Offers Insights: 

Examining the distribution of various audio features using histograms provided a deeper understanding of the dataset's composition. For instance, the histogram for valence showed a positive skew, suggesting a prevalence of songs with positive emotional connotations. This aligns with the popularity of high-energy and danceable music, as positive emotions often accompany those characteristics. These histograms offered valuable insights into the dataset's makeup and potential listener preferences. For example, with the bin width of 0.5 both energibility which has a positive skewness and acousticness has an opposite skewness.


# The Most Important Insight

The most significant insight from our analysis is the confirmation of a positive correlation between danceability, energy, and song popularity on Spotify. This finding is crucial because it directly links musical characteristics to listener preferences. It validates our initial hypothesis that listeners gravitate towards energetic and upbeat music, offering valuable knowledge for the music industry. Artists and producers can leverage this to create music that resonates better with audiences. Music streaming services can also use this insight to refine recommendation systems, prioritizing songs with higher danceability and energy for users with similar taste. This can lead to a more personalized and engaging user experience. The positive correlation is visually evident in the first graph's cluster of data points concentrated in the high danceability and high energy region. Overall, this takeaway highlights the importance of danceability and energy in shaping song popularity on streaming platforms.

# Broader Implications

This exploration has broader implications for the music industry. By recognizing the influence of danceability and energy on popularity, artists and producers can make informed decisions about the direction of their music. Additionally, music streaming services can leverage this knowledge to refine their recommendation algorithms, leading to a more personalized and engaging user experience. Furthermore, policymakers can utilize this information to gain insights into listener preferences and potential biases within music streaming platforms.

In conclusion, our analysis of the Spotify music dataset shed light on the connections between musical characteristics and song popularity. The positive correlation between danceability and energy with popularity offers valuable insights for the music industry, informing creative decisions, recommendation systems, and potentially even music policy. As music continues to evolve, further exploration of these relationships will be crucial for understanding listener preferences and shaping the future of music consumption.

###References

References:
1.	 Jockims, Trevor Laurence. “How Spotify AI Plans to Know before You Do What Your Brain Wants to Listen To.” CNBC, CNBC, 18 Apr. 2024, www.cnbc.com/2024/04/14/how-spotify-ai-plans-to-know-whats-going-on-inside-your-head.html 
2.	Fink, Jennifer. “Why — and How — Music Moves Us” Pfizer, 2024, www.pfizer.com/news/articles/why_and_how_music_moves_us#:~:text=Music%20and%20Mood&text=The%20limbic%20system%2C%20which%20is,when%20our%20ears%20perceive%20music.&text=The%20chills%20you%20feel%20when,of%20pleasure%20and%20well%2Dbeing
3.	Twaddle, Alan. “Listening to This Music Will Make You Happy!” Medium, Medium, 20 Aug. 2021, https://www.medium.com/@twaddlac/listening-to-this-music-will-make-you-happy-751182d8c5cd 
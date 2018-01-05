# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Regression Challenge
Week 6 | Days 4-5

## The Times university ranking dataset analysis

A university has chosen your consulting firm to help them understand and improve their standings in the Times rankings of universities.  Your company will be presentings your findings to a review board from the university TODAY at 2pm.  The review board consists of members from across the university: both professors and administrators.  Your presentation must contain both a technical defense of your work (ex: preprocessing methodology, EDA findings, engineered features, feature/model selection, evaluation criteria, results, conclusion) and solid recommendations to move forward (action items or future work).

In this challenge, you will draw on the skills you have learned over the past five weeks to create a model of university prestige using the provided predictors. Specifically, your goal is to **predict the total score for each university for the year 2016**. This score directly maps into the university ranking.

You will be drawing on the following skills:
- Basic python and pandas skills
- Data cleaning
- EDA
- Modeling
    - Regression
    - Regularization
    - kNN (might be helpful for exploratory analysis)
    - SGD (see docs for more info!)
- Cross validation
- Communicating results to a non-technical audience

## The Dataset

The data is in a csv file in your repo. It contains the following columns:

- **world_rank** - world rank for the university. Contains rank ranges and equal ranks (e.g. = 94 and 201-250).
- **university_name** - name of university.
- **country** - country of each university.
- **teaching** - university score for teaching (the learning environment).
- **international** - university score international outlook (staff, students, research).
- **research** - university score for research (volume, income and reputation).
- **citations** - university score for citations (research influence).
- **income** - university score for industry income (knowledge transfer).
- **total_score** - total score for university, used to determine rank.
- **num_students** - number of students at the university.
- **student_staff_ratio** - Number of students divided by number of staff.
- **international_students** - Percentage of students who are international.
- **female_male_ratio** - Female student to Male student ratio.
- **year** - year of the ranking (2011 to 2016 included).

### The target for our model is the **total score**, which directly corresponds to the final ranking.

### Note: A total score reported as "-" should be considered a 0, and '-' entries in the submisison will be scored as  0. Consider the implications of this for calculating the loss (MSE).


## Guidelines

The analysis is up to you. **This is fully open-ended.** You are expected to:

- Load the packages you need to do analysis
- Perform EDA on variables of interest
- Form a hypothesis on what is important for the score
- Check your data for problems, clean and munge data into correct formats
- Create or combine new columns/features where beneficial
- Perform statistical analysis with regression and describe the results

---

Arjun (who is the best) will be here in class to help, but if you do not know how to do something, we expect you to **check documentation first**.

**You are not expected to know how to do things by heart. Knowing how to effectively look up the answers on the internet is a critical skill for data scientists!**

## Deliverables

- You will be provided with the data and targets from 2011 through 2015 and the data (no targets) for 2016.
    + Final answers should be submitted by filling in the predicted values for each university in the **submission sheet**. (.to_csv() should be useful for this). Note there are three columns: Rank, Name, and Score. The row order matches the rankings list from the 2016 data.
    + Your submission will be assessed on MSE for the Score column -- so consider your loss functions! <br><br>


- Finally, you will design and deliver a **5 minute presentation** to the university review board. Your presentation must:
    + Defend your model selection
    + Defend your model performance
    + Interpret the model
    + Give clear guidelines to improve rankings


- Remember your audience contains some experts (Arjun) who will want to understand the strength of your predictions, others who will want to know they are getting the best version possible, and still more who only want to know which actions will help their ranking the most.  Do your best to meet all these demands without alienating anyone.

## Teams

You will be working as part of a team on this (selected randomly by Python):

<table>
<tr>
<th>The Peyton Manning Fan Clubbers</th>
<th>Bean Town Cubs Fans</th>
<th>Team GA: Gangsters Anonymous</th>
</tr>

<tr>
<td>Tim</td>
<td>Marissa</td>
<td>Quentin</td>
</tr>

<tr>
<td>Ajinth</td>
<td>Ben Seifert</td>
<td>Jenelle</td>
</tr>

<tr>
<td>Chris Mantell</td>
<td>Mark</td>
<td>Tom Brewer</td>
</tr>


<tr>
<td>Ben Tweed</td>
<td>Andrew</td>
<td>Pooja</td>
</tr>

<tr>
<td>Pernesso</td>
<td>Yue</td>
<td></td>
</tr>

</table>


As a team you are responsible for one copy of each deliverable to be submitted as an issue on this repo by **5 PM Today**.  That is to say, one each of:
- Submission csv
- Analysis notebook (does not have to be commented)
- 5-8 min Presentation

Every team member must speak in the final presentation, and be ready to answer questions on the process the group used to refine, choose, and interpret the model used to make predictions. Communication is just as important (if not more important!) as the machine learning and programming skills we teach in this course, but does not get the same attention. Communicating findings to non-technical colleages, as well as defending your scientific methodology is a critical skill!

Good luck!


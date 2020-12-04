import cx_Oracle
import pandas as pd

"""
Some quick start guides:
* cx_Oracle 8: https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html
* pandas: https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html
"""
# TODO change path of Oracle Instant Client to yours
cx_Oracle.init_oracle_client(lib_dir = "/Users/flarb9/Downloads/instantclient_19_8")

# TODO change credentials
# Connect as user "user" with password "mypass" to the "CSC423" service
# running on lawtech.law.miami.edu
connection = cx_Oracle.connect(
    "ropicsc423", "mypass", "lawtech.law.miami.edu/CSC_423")
cursor = connection.cursor()

#all the classes available on Monday
cursor.execute("""
    SELECT *
    FROM Course
    WHERE WeekDay LIKE '%M%'
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print(df) # examine
print(df.columns)
# print(df['FIRST_NAME']) # example to extract a column

#show courses available for the spring semester in the evening
cursor.execute("""
    SELECT *
    FROM Course
    WHERE (EndMonth = 'March') AND (TimeOfDay = 'Evening')
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print(df) # examine
print(df.columns)

#print students enrolled in the Fall semester
cursor.execute("""
    SELECT Course.CourseName, Enrolled.StudentName
    FROM Enrolled, Course
    WHERE (Enrolled.CourseName = Course.CourseName) AND (Course.StartMonth = 'August' OR Course.StartMonth = 'October')
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print(df) # examine
print(df.columns)

#all the tutors with a Friday class.
cursor.execute("""
    SELECT Tutor.TutorName, Tutor.TutorID, Course.CourseName
    FROM Tutor, Course
    WHERE (Course.WeekDay LIKE '%F%') AND (Tutor.CourseName = Course.CourseName)
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print(df) # examine
print(df.columns)

#sort by tutor that can handle the most and give their name
cursor.execute("""
    SELECT Tutor.TutorName, TutorAmount.CourseName, TutorAmount.WeekDay, TutorAmount.TimeOfDay, TutorAmount.ClassSize
    FROM TutorAmount, Tutor
    WHERE (Tutor.TutorID = TutorAmount.TutorID)
    ORDER BY ClassSize DESC
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print(df) # examine
print(df.columns)

-- Keep a log of any SQL queries you execute as you solve the mystery.
-- First of all check .schema of all tables

-- Check description of crime reports on Humphrey Streets on July 27, 28, 29 and 30 2021
    SELECT description, day FROM crime_scene_reports
    WHERE year = 2021
    AND month = 7
    AND day = 27
    OR day = 28
    OR day = 29
    OR day = 30
    AND street = 'Humphrey Street';
--
                                                                                                       description                                                                                                        | day |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----+
| Money laundering took place at 19:53. One person witnessed the incident.                                                                                                                                                 | 27  |
| Forgery took place at 05:50. One person witnessed the incident.                                                                                                                                                          | 27  |
| Money laundering took place at 17:54. Two people witnessed the event.                                                                                                                                                    | 27  |
| Burglary took place at 09:25. No known witnesses.                                                                                                                                                                        | 27  |
| Bank robbery took place at 17:43. One person witnessed the incident.                                                                                                                                                     | 27  |
| Insider trading took place at 23:06. No known witnesses.                                                                                                                                                                 | 27  |
| Shoplifting took place at 16:40. No known witnesses.                                                                                                                                                                     | 27  |
| Shoplifting took place at 06:55. Two people witnessed the event.                                                                                                                                                         | 27  |
| Insider trading took place at 14:36. One person witnessed the incident.                                                                                                                                                  | 27  |
| Vandalism took place at 06:37. No known witnesses.                                                                                                                                                                       | 27  |
| Money laundering took place at 17:47. Two people witnessed the event.                                                                                                                                                    | 27  |
| Wire fraud took place at 23:58. Two people witnessed the event.                                                                                                                                                          | 27  |
| Shoplifting took place at 05:51. No known witnesses.                                                                                                                                                                     | 27  |
| Vandalism took place at 12:04. No known witnesses.                                                                                                                                                                       | 28  |
| Shoplifting took place at 03:01. Two people witnessed the event.                                                                                                                                                         | 28  |
| Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery. | 28  |
| Money laundering took place at 20:30. No known witnesses.                                                                                                                                                                | 28  |
| Littering took place at 16:36. No known witnesses.                                                                                                                                                                       | 28  |
| Insider trading took place at 06:35. One person witnessed the incident.                                                                                                                                                  | 29  |
| Littering took place at 17:49. Two people witnessed the event.                                                                                                                                                           | 30  |
--
-- | Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery. | 28  |

-- Check interviews araound the date where backery its being mentioned

SELECT * FROM interviews
WHERE year = 2021
AND month = 7;

--
| 157 | Charlotte   | 2021 | 7     | 27  | “He was in the house about half an hour, and I could catch glimpses of him in the windows of the sitting-room, pacing up and down, talking excitedly, and waving his arms. Of her I could see nothing. Presently he emerged, looking even more flurried than before. As he stepped up to the cab, he pulled a gold watch from his pocket and looked at it earnestly, ‘Drive like the devil,’ he shouted, ‘first to Gross & Hankey’s in Regent Street, and then to the Church of St. Monica in the Edgeware Road. Half a guinea if you do it in twenty minutes!’                                                                                                                            |
| 158 | Jose        | 2021 | 7     | 28  | “Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 159 | Eugene      | 2021 | 7     | 28  | “I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed at your having gone to the ball.”                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| 160 | Barbara     | 2021 | 7     | 28  | “You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 161 | Ruth        | 2021 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 162 | Eugene      | 2021 | 7     | 28  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's' bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| 163 | Raymond     | 2021 | 7     | 28  | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.                                                                                                                                                                                                                                                                                                                                                                        |
| 191 | Lily        | 2021 | 7     | 28  | Our neighboring courthouse has a very annoying rooster that crows loudly at 6am every day. My sons Robert and Patrick took the rooster to a city far, far away, so it may never bother us again. My sons have successfully arrived in Paris.
-- Ruth, Eugene and Raymond gave important information about the theft: ATM, FOOTAGE AND CALLS
-- Check bakery security logs
--
SELECT * FROM bakery_security_logs
WHERE year = 2021
AND month = 7
AND day = 28
AND hour = 10;
--  9 people exiting the bakery around 10.16 and 10.35 (license_plate)

-- Check atm withdrawls
SELECT DISTINCT(atm_location) FROM atm_transactions


SELECT * FROM atm_transactions
WHERE atm_location = 'Humphrey Lane'
AND year = 2021
AND month = 7
AND day = 28
AND transaction_type = 'withdraw'
ORDER BY amount;

-- Check phone_calls
SELECT duration, caller, receiver FROM phone_calls
WHERE year = 2021
AND month = 7
AND day = 28
ORDER BY duration;

-- Check persons that share caller oder receiver number, license plate during that period of time:
SELECT name FROM people
WHERE people.phone_number
IN (SELECT phone_number FROM phone_calls
WHERE year = 2021
AND month = 7
AND day = 28)
AND people.license_plate
IN (SELECT license_plate FROM bakery_security_logs
WHERE year = 2021
AND month = 7
AND day = 28
AND hour = 10);

-- CROSS ALL DATA TO DEFINE PRIME SUSPECT
SELECT *
FROM bank_accounts
JOIN people ON people.id = bank_accounts.person_id
WHERE people.phone_number
IN (SELECT phone_number FROM phone_calls
    WHERE year = 2021
    AND month = 7
    AND day = 28)
AND people.license_plate
IN (SELECT license_plate
    FROM bakery_security_logs
    WHERE year = 2021
    AND month = 7
    AND day = 28
    AND hour = 10)
AND bank_accounts.account_number
IN (SELECT account_number
    FROM atm_transactions
    WHERE atm_location = 'Leggett Street'
    AND year = 2021
    AND month = 7
    AND day = 28
    AND transaction_type = 'withdraw');


+----------------+-----------+---------------+--------+--------+----------------+-----------------+---------------+
| account_number | person_id | creation_year |   id   |  name  |  phone_number  | passport_number | license_plate |
+----------------+-----------+---------------+--------+--------+----------------+-----------------+---------------+
| 58552019       | 652412    | 2013          | 652412 | Denise | (994) 555-3373 | 4001449165      | NRYN856       |
+----------------+-----------+---------------+--------+--------+----------------+-----------------+---------------+

Denise is the thief

-- Check where she went

SELECT *
FROM airports
JOIN flights ON flights.destination_airport_id = airports.id
OR flights.origin_airport_id = airports.id
WHERE airports.id
IN (SELECT origin_airport_id
    FROM flights
    JOIN passengers ON passengers.flight_id = flights.id
    WHERE flights.id
    IN  (SELECT passengers.flight_id
        FROM passengers)
    AND passengers.passport_number = 4001449165)
ORDER BY hour;


DELHI

-- Check the accomplice by the telefone number

SELECT *
FROM people
JOIN phone_calls ON phone_calls.caller = people.phone_number
OR phone_calls.receiver = people.phone_number
WHERE people.phone_number
IN (SELECT phone_number FROM phone_calls
    WHERE year = 2021
    AND month = 7
    AND day = 28)
AND people.name = 'Denise';


SELECT *
FROM phone_calls
JOIN people ON people.phone_number = phone_calls.caller
WHERE people.name = 'Denise';
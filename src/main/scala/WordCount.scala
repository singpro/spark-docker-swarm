import org.apache.spark._
import org.apache.spark.SparkContext._
 
// Spark entry point
object WordCount {
  def main(args: Array[String]) {

    val conf = new SparkConf().setAppName("wordCount")
    val sc = new SparkContext(conf)

    val words: String = "test test"
    val seq = words.split(" ")
    val data = sc.parallelize(seq)

    val counts = data.map(word => (word, 1)).reduceByKey(_ + _).collect()

    println(counts)
    sc.stop()
  }
}


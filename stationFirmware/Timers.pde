import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

int refTime=3000;
boolean timerStopped=false;

CountdownTimer timer;
String timerCallbackInfo = "";

void timerSetup() {
  timer = CountdownTimerService.getNewCountdownTimer(this).configure(100, refTime).start();
}

void timersUpdate() {
  if (timerStopped) {
  } else {
  }
}


void onTickEvent(CountdownTimer t, long timeLeftUntilFinish) {
  //timerCallbackInfo = "[tick] - timeLeft: " + timeLeftUntilFinish + "ms";
}

void onFinishEvent(CountdownTimer t) {
  println("FINISHED");
  updateRoutine();
  //println("Starting timer...");
  //timer.start();
  timer = CountdownTimerService.getNewCountdownTimer(this).configure(100, refTime).start();
}

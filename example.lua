local sketch=require("SketchLib")

monitorPer=peripheral.wrap("top")

sketch.setMonitor(monitorPer)


sketch.background(colors.gray)

sketch.fill(colors.red)
sketch.rect(2, 3, 20, 20)

sketch.fill(colors.blue)
sketch.setStrokeWeight(2)
sketch.stroke(colors.green)
sketch.rect(5, 5, 10, 10)

sketch.noStroke()
sketch.fill(colors.yellow)
sketch.rect(30, 30, 5, 5)


sketch.noFill()
sketch.setStrokeWeight(1)
sketch.stroke(colors.purple)
sketch.rect(40, 40, 14, 12)


sketch.fill(colors.white)
sketch.setStrokeWeight(1)
sketch.stroke(colors.black)

sketch.circle(40,40,8)
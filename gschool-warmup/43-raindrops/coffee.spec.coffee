Raindrops = require('./raindrops').Raindrops

describe 'Raindrops', ->
  drops = new Raindrops()

  it "1 drop", ->
    dropString = drops.convert(1)
    expect(dropString).toEqual("1")

  it "3 drops", ->
    dropString = drops.convert(3)
    expect(dropString).toEqual("Pling")

  it "5 drops", ->
    dropString = drops.convert(5)
    expect(dropString).toEqual("Plang")

  it "7 drops", ->
    dropString = drops.convert(7)
    expect(dropString).toEqual("Plong")

  it "6 drops", ->
    dropString = drops.convert(6)
    expect(dropString).toEqual("Pling")

  it "9 drops", ->
    dropString = drops.convert(9)
    expect(dropString).toEqual("Pling")

  it "10 drops", ->
    dropString = drops.convert(10)
    expect(dropString).toEqual("Plang")

  it "14 drops", ->
    dropString = drops.convert(14)
    expect(dropString).toEqual("Plong")

  it "15 drops", ->
    dropString = drops.convert(15)
    expect(dropString).toEqual("PlingPlang")

  it "21 drops", ->
    dropString = drops.convert(21)
    expect(dropString).toEqual("PlingPlong")

  it "25 drops", ->
    dropString = drops.convert(25)
    expect(dropString).toEqual("Plang")

  it "35 drops", ->
    dropString = drops.convert(35)
    expect(dropString).toEqual("PlangPlong")

  it "49 drops", ->
    dropString = drops.convert(49)
    expect(dropString).toEqual("Plong")

  it "52 drops", ->
    dropString = drops.convert(52)
    expect(dropString).toEqual("52")

  it "105 drops", ->
    dropString = drops.convert(105)
    expect(dropString).toEqual("PlingPlangPlong")

  it "12121 drops", ->
    dropString = drops.convert(12121)
    expect(dropString).toEqual("12121")
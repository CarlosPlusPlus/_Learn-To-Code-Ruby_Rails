Crypto = require('./crypto').Crypto

describe "Crypto", ->
  it "normalize strange characters", ->
    crypto = new Crypto('s#$%^&plunk')
    expect(crypto.normalizePlaintext()).toEqual("splunk")

  it "normalize numbers", ->
    crypto = new Crypto('1, 2, 3 GO!')
    expect(crypto.normalizePlaintext()).toEqual("123go")

  it "size of small square", ->
    crypto = new Crypto('1234')
    expect(crypto.size()).toEqual(2)

  it "size of slightly larger square", ->
    crypto = new Crypto('123456789')
    expect(crypto.size()).toEqual(3)

  it "size of non-perfect square", ->
    crypto = new Crypto('123456789abc')
    expect(crypto.size()).toEqual(4)

  it "plain text segments", ->
    crypto = new Crypto('Never vex thine heart with idle woes')
    expect(crypto.plaintextSegments()).toEqual(["neverv", "exthin", "eheart", "withid", "lewoes"])

  it "plain text segments", ->
    crypto = new Crypto('ZOMG! ZOMBIES!!!')
    expect(crypto.plaintextSegments()).toEqual(["zomg", "zomb", "ies"])

  it "cipher text", ->
    crypto = new Crypto('Time is an illusion. Lunchtime doubly so.')
    expect(crypto.ciphertext()).toEqual("tasneyinicdsmiohooelntuillibsuuml")

  it "cipher text", ->
    crypto = new Crypto('We all know interspecies romance is weird.')
    expect(crypto.ciphertext()).toEqual("wneiaweoreneawssciliprerlneoidktcms")

  it "normalized cipher text", ->
    crypto = new Crypto('Madness, and then illumination.')
    expect(crypto.normalizeCiphertext()).toEqual('msemo aanin dninn dlaet ltshu i')

  it "more normalized cipher text", ->
    crypto = new Crypto('Vampires are people too!')
    expect(crypto.normalizeCiphertext()).toEqual('vrela epems etpao oirpo')
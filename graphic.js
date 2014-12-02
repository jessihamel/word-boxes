function color(code) {
  if (code == 13 ) {
    return "#F15A29";
  } else if (code == 10 || code == 11) {
    return "#00A99D";
  } else {
    return "#b2b2b2";
  }
}


function makeSquares(csv, containerdiv) {
  d3.csv(csv, function(data) {

    d3.select(containerdiv).append("ul")
      .selectAll("li")
      .data(data)
      .enter()
      .append("li")
      .append("span")
      .style("background", function(d) { return color(d.code); });

    d3.select("#graphic").selectAll("li")
    .on("mouseover", function(d) {
      d3.select(this)
      .append("div")
      .attr("class", "tooltip")
      .style("opacity", 0)
      .transition()
      .duration(200)
      .style("opacity", ".9")
      .text(d.word);
      })
    .on("mouseout", function(d) {
      d3.select(this).selectAll("div")
      .transition()
      .duration(500)
      .style("opacity", 0)
      .remove();
      })
    .on("click", function(d) {
      thisCode = d.code
      thisWord = d.word
      d3.select("#graphic")
        .selectAll("span")
        .style("background", function(d) {
          if (d.code == thisCode)
            {return "#EC059E"}
          else
            {return color(d.code)}
           });
      d3.select("#choice")
        .text(d.word)
    });
  // reset function
    d3.select("#key")
      .on("click", function(d) {
        d3.select("#graphic")
          .selectAll("span")
          .style("background", function(d) { return color(d.code); });
        d3.select("#choice")
          .text("(Click on any box to see how often that word appears in the text.)");
      })
  });
}

makeSquares("wordfile.csv", "#catinhat");

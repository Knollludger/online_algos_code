using Plots
using Random
function random_algo(N)
    index = 1;
    while(random_flip(N) != random_flip(N))
        index += 1
    end
    return index
end

function algo_wrapper(N,times, fn)
    count = 0;
    index = 0
    while index < times
        count += fn(N)
        index += 1
    end
    print("progress: $N   \r")
    flush(stdout)
    return (count / times)
end

function stay_put_algo(N)
    index = 1;
    loc = get_rand_location(N)
    # while(index < loc)
    #     index += 1
    # end
    return loc;
end

function random_flip(N)
    return rand(1:N)
end

function get_rand_location(N)
    return rand(1:N)
end

ns = LinRange(1,1000,100)
times = 1000
randoms = map((x) -> algo_wrapper(floor(x),times,random_algo),ns)
println("\n")
stay_puts = map((x) -> algo_wrapper(floor(x),times,stay_put_algo),ns)

p = plot(ns, stay_puts,color = "green",xlabel = "number of shops",legend = :outertopleft, ylabel = "days taken",labels="wait for mommy",bg = RGB(0.2, 0.2, 0.2), smooth=:true)
plot!(p,ns,randoms, smooth=:true, labels="random")
# scatter!(p,ns,true_rands, smooth=:true)
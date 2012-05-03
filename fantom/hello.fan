using util
using web
using wisp

class WebHello : AbstractMain
{
	@Opt { help = "http port" }
	Int port := 8080
	
	override Int run()
	{
		wisp := WispService
		{
			it.port = this.port
			it.root = HelloMod()
		}
		return runServices([wisp])
	}
}

const class HelloMod : WebMod
{
	override Void onGet()
	{
		res.headers["Content-Type"] = "text/plain"
		res.out.print("hello world #4")
	}
}
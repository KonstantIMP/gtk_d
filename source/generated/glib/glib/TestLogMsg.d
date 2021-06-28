module glib.TestLogMsg;

private import glib.c.functions;
public  import glib.c.types;
private import linker.loader;


/** */
public class TestLogMsg
{
	/** the main Gtk struct */
	protected GTestLogMsg* gTestLogMsg;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GTestLogMsg* getTestLogMsgStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gTestLogMsg;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gTestLogMsg;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTestLogMsg* gTestLogMsg, bool ownedRef = false)
	{
		this.gTestLogMsg = gTestLogMsg;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GLIB[0]) && ownedRef )
			g_test_log_msg_free(gTestLogMsg);
	}


	/**
	 * Internal function for gtester to free test log messages, no ABI guarantees provided.
	 */
	public void free()
	{
		g_test_log_msg_free(gTestLogMsg);
		ownedRef = false;
	}
}

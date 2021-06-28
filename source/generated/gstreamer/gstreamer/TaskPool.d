module gstreamer.TaskPool;

private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;
private import gstreamer.ObjectGst;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * This object provides an abstraction for creating threads. The default
 * implementation uses a regular GThreadPool to start tasks.
 * 
 * Subclasses can be made to create custom threads.
 */
public class TaskPool : ObjectGst
{
	/** the main Gtk struct */
	protected GstTaskPool* gstTaskPool;

	/** Get the main Gtk struct */
	public GstTaskPool* getTaskPoolStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstTaskPool;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gstTaskPool;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstTaskPool* gstTaskPool, bool ownedRef = false)
	{
		this.gstTaskPool = gstTaskPool;
		super(cast(GstObject*)gstTaskPool, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gst_task_pool_get_type();
	}

	/**
	 * Create a new default task pool. The default task pool will use a regular
	 * GThreadPool for threads.
	 *
	 * Returns: a new #GstTaskPool. gst_object_unref() after usage.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gst_task_pool_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstTaskPool*) __p, true);
	}

	/**
	 * Wait for all tasks to be stopped. This is mainly used internally
	 * to ensure proper cleanup of internal data structures in test suites.
	 *
	 * MT safe.
	 */
	public void cleanup()
	{
		gst_task_pool_cleanup(gstTaskPool);
	}

	/**
	 * Join a task and/or return it to the pool. @id is the id obtained from
	 * gst_task_pool_push().
	 *
	 * Params:
	 *     id = the id
	 */
	public void join(void* id)
	{
		gst_task_pool_join(gstTaskPool, id);
	}

	/**
	 * Prepare the taskpool for accepting gst_task_pool_push() operations.
	 *
	 * MT safe.
	 *
	 * Throws: GException on failure.
	 */
	public void prepare()
	{
		GError* err = null;

		gst_task_pool_prepare(gstTaskPool, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
	}

	/**
	 * Start the execution of a new thread from @pool.
	 *
	 * Params:
	 *     func = the function to call
	 *     userData = data to pass to @func
	 *
	 * Returns: a pointer that should be used
	 *     for the gst_task_pool_join function. This pointer can be %NULL, you
	 *     must check @error to detect errors.
	 *
	 * Throws: GException on failure.
	 */
	public void* push(GstTaskPoolFunction func, void* userData)
	{
		GError* err = null;

		auto __p = gst_task_pool_push(gstTaskPool, func, userData, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}
}
